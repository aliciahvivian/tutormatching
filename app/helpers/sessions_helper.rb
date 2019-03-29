module SessionsHelper
 def log_in(tutor)
    session[:tutor_id] = tutor.id
 end
 
 def current_person?(person)
    person == current_person
 end
 
 def current_tutor
   if session[:tutor_id]
    @current_tutor ||= Tutor.find_by(id: session[:tutor_id])
   end
 end
 
 def logged_in?
  !current_tutor.nil?
 end
 
 def log_out
  session.delete(:tutor_id)
  @current_tutor = nil
 end
end
