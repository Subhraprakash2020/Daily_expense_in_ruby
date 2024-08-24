class ExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_expense, only: [:edit, :update, :destroy]

  def new
    @expense = current_user.expenses.build
  end

  def create
    @expense = current_user.expenses.build(expense_params)
    if @expense.save
      redirect_to dashboard_path(current_user), notice: "Expense created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def edit
  #   # if @expense.update(expense_params)
  #   #   redirect_to dashboard_path(current_user), notice: "Expense updated successfully!"
  #   # else
  #   #   render :edit, status: :unprocessable_entity
  #   # end
  # end

  def update
    if @expense.update(expense_params)
      redirect_to dashboard_path(current_user), notice: "Expense updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @expense = current_user.expenses.find(params[:id])
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path(current_user), notice: "Expense was successfully deleted." }
      format.js   # This will render destroy.js.erb
    end
  end

  # def destroy
  #   @expense = current_user.find(params[:id])
  #   @expense = @User.expense.find(params[:id])
  #   @expense.destroy
  #   redirect_to dashboard_path(@user), status: :see_other
  # end

  def show
    @expense = current_user.expenses.find(params[:id])
  end

  private

  def set_expense
    @expense = current_user.expenses.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:title, :amount, :payment_type)
  end
end
