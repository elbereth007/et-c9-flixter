# firehose track 4, lesson 27 - file created 27 jun 17 for student enrollment

class EnrollmentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    current_user.enrollments.create(course: current_course)
#    redirect_to course_path(current_course)
    
    # next 14 lines added 28 jun 17 for accepting payments using stripe, copied/modified from strip.com (lesson 29)
    
    # Amount in cents
    @amount = (current_course.cost * 100).to_i

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]  # stripe token is the value Stripe gives us, which links this 2nd stage of the credit card capturing 
    )                               # process to the 1st stage. it allows us to reference credit card details for the specific user who 
                                    # entered their information.

    charge = Stripe::Charge.create(     # this step reaches out to the Stripe servers to capture the funds from our user's bank account
      customer: customer.id,
      amount: @amount,
      description: 'Flixter Premium Content',
      currency: 'usd'
    )
    
  redirect_to course_path(current_course)   # moved from def create block 28 jun 17 (lesson 29)

  rescue Stripe::CardError => e       # only triggered if Stripe raises an error
    flash[:error] = e.message
    redirect_to root_path
  end
  
  private

  def current_course
    @current_course ||= Course.find(params[:course_id])
  end
  
end
