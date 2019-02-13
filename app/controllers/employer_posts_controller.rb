class EmployerPostsController < ApplicationController
    require 'geoip'
    
    before_action :authenticate_request!, except: [:index,:public_jobs,:my_point,:offer_list,:show]
    before_action :set_employer_post, only: [:show,:edit,:update,:destroy]
    before_action :check_location, only: [:public_jobs,:private_jobs]
    
    def index
      employers = EmployerPost.most_recent_first
      alljobs = []
      employers.order(id: :desc).each do |employer|
          alljobs << {job: employer, location: employer.job_location, insight: employer.insight, 
          customer: employer.customer, user: employer.customer.user.email}
      end      
      render json: alljobs, status: :ok
    end
    def most_recent_list
       employers = EmployerPost.most_recent_first
       alljobs = []
       employers.each do |employer|
          alljobs << {job: employer, location: employer.job_location, insight: employer.insight, 
          customer: employer.customer, user: employer.customer.user.email}
      end  
      render json: alljobs, status: :ok
    end
    def offer_list
        offers = EmployerPost.paginate(:page => params[:page], :per_page => 3)
        alljobs = []
      offers.each do |employer|
          alljobs << {job: employer, location: employer.job_location, insight: employer.insight, 
          customer: employer.customer, user: employer.customer.user.email}
      end      
      render json: alljobs, status: :ok
    end    
   def public_jobs
     #geoip = GeoIP2Compat.new('/opt/GeoIP/GeoLite2-City_20171205/GeoLite2-City.mmdb')
     geoip = GeoIP::City.new('/opt/GeoIP/GeoLiteCity.dat')
     cunnect = geoip.look_up(request.remote_ip)
     if cunnect == nil
         latitude=9.066667
         longitude=7.483333
         locations = JobLocation.near([latitude,longitude],200000)
     else
         locations = JobLocation.near([cunnect[:latitude],cunnect[:longitude]],200000)
     end
     #employers = EmployerPost.all
     publicjobs = []
      #locations.order(id: :asc).limit(6).each do |location|
       locations.order(id: :asc).each do |location| 
            publicjobs << {job: location.employer_post, location: location, insight: location.insight, 
            customer: location.customer, user: location.customer.user.email}
       #publicjobs << {job: job, insight: job.insights, location: job.job_locations}
         
      end
      
      render json: publicjobs, status: :ok
   end
    def my_point
        #geoip = GeoIP2Compat.new('/opt/GeoIP/GeoLite2-City_20171205/GeoLite2-City.mmdb')
        geoip = GeoIP::City.new('/opt/GeoIP/GeoLiteCity.dat')
        @cunnect = geoip.look_up(request.remote_ip)
        if @cunnect == nil
            @cunnect = {:country_code=>"NG", :country_code3=>"NGS", :country_name=>"Nigeria", :region=>"01", :region_name=>"Abuja", :city=>"Abuja", :postal_code=>"80500", :latitude=>9.066667, :longitude=>7.483333} 
            render json: @cunnect, status: :ok
        else
            render json: @cunnect, status: :ok
        end
    end
     
   def private_jobs
     #geoip = GeoIP2Compat.new('/opt/GeoIP/GeoLite2-City_20171205/GeoLite2-City.mmdb')
     geoip = GeoIP::City.new('/opt/GeoIP/GeoLiteCity.dat')
     cunnect = geoip.look_up(request.remote_ip)
     #locations = JobLocation.near([cunnect[:latitude],cunnect[:longitude]],200000)
     if cunnect == nil
         latitude=9.066667
         longitude=7.483333
         locations = JobLocation.near([latitude,longitude],200000)
     else
         locations = JobLocation.near([cunnect[:latitude],cunnect[:longitude]],200000)
     end
     #employers = EmployerPost.all
     privatejobs = []
      locations.each do |location|
        
            privatejobs << {job: location.employer_post, location: location, insight: location.insight, 
            customer: location.customer, user: location.customer.user.email}
      end
      
      render json: privatejobs, status: :ok
   end
    def show
        #offer = []
        #offer << {job: @employer_post,insight: @employer_post.insight, location: @employer_post.job_location, customer: @employer_post.customer}
     insight = @employer_post.insight      
     #location = @employer_post.job_locations
    
    render json: insight, status: :ok
    logger.debug "New article: #{insight.attributes.inspect}"
    end
  
    def new
    @employer_post = EmployerPost.new
    @employer_post.insight.build
    end
    
    def create
      @employer_post = EmployerPost.new(employer_post_params)
      #employer_post.customer_id = 1
      #insight  = params[:insight]
      #employer_post.insight.build
      if @employer_post.save
        render json: @employer_post, status: :created
      else
        render json: { errors: @employer_post.errors.full_messages }, status: :bad_request
      end
    end
    def update
      @employer_post.update_attributes(employer_post_params)
      #if employer_post.
      #  render json: @employer_post, status: :updated
      #else
      #  render json: { errors: employer_post.errors.full_messages }, status: :bad_request
      #end
    end
    private
    
    def employer_post_params
      params.require(:employer_post).permit(:id, :customer_id, :title, :description, insight_attributes:[:available_date,
      :job_category,:employee_category,:job_duration,:pay_type,:employee_type,:employee_title,:employee_experience])
    end
    def set_employer_post
        @employer_post = EmployerPost.find(params[:id])
    end 
    def check_location
      EmployerPost.all.each do |post|
          unless post.job_location
              JobLocation.create(location: post.customer.address,city: post.customer.city,state:post.customer.state,employer_post_id: post.id)
          end
      end
    end

end