class LessonsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_enrollment_for_current_course, only: [:show]

	def show
	end 

	private 

	def require_enrollment_for_current_course
		if !current_user.enrolled_in?(current_lesson.section.course) 
			redirect_to courses_path, alert: 'Please enroll in the coruse first!'
    	end
  	end

	helper_method :current_lesson
	def current_lesson
		@current_lesson ||= Lesson.find(params[:id])
	end 
end
