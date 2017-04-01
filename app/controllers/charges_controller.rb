class ChargesController < ApplicationController
  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: upgrade_message,
      amount: upgrade_amount
    }
  end

  def create
    customer = Stripe::Customer.create(email: current_user.email, card: params[:stripeToken])

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: upgrade_amount,
      description: upgrade_message,
      currency: 'usd'
    )

    current_user.update_attribute(:role, :premium)

    flash[:notice] = "Thanks for upgrading, #{current_user.name}!"
    redirect_to root_path

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end

  def confirm
  end

  def destroy
    current_user.wikis.each { |w| w.update_attribute(:private, false) }
    current_user.update_attribute(:role, :standard)
    flash[:notice] = "Sorry to see you leave premium, #{current_user.name}!"
    redirect_to root_path
  end

  private

  def upgrade_amount
    1500
  end

  def upgrade_message
    "Blocipedia Membership - #{current_user.email}"
  end
end
