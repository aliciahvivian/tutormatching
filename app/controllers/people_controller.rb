class PeopleController < ApplicationController
  def new
   @tutor_person = TutorPerson.new
  end
  
  def edit
     @tutor = Tutor.find(params[:id])
     @person = Person.find(@tutor.people_id)
     @tutor_person = TutorPerson.new({:name => @person.name, :email => @person.email, :grade => @tutor.grade, :id_num => @tutor.id_num})
  end
  
  def show
     @tutor = Tutor.find(params[:id])
     @person = Person.find(@tutor.people_id)
     @tutor_person = TutorPerson.new({:name => @person.name, :email => @person.email, :grade => @tutor.grade, :id_num => @tutor.id_num})
   # debugger
  end
  
  def update 
    @person = Person.find(Tutor.find(params[:id]).people_id)
    if @person.update_attributes(tutor_params)
    
    else 
    render 'edit'
    end
  end
  
  private 
  
    def tutor_params
      params.require(:tutor_person).permit(:id_num, :grade, :name, :email, :password, :password_confirmation)
    end
    def tutor_person
      TutorPerson.new(tutor_params)
    end
end
