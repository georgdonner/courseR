module SubjectsHelper

	def generate_tab_id(course)
		@tab_id="#{course.id}-tab"
	end

	def is_active(course)
		@tab_id='active' if course==@subject.courses.first
	end
end
