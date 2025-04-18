class ProgrammingLanguagesController < ApplicationController
  # This callback is run before the specified actions (show, edit, update, destroy).
  # It finds and sets the programming language by its ID.
  before_action :set_programming_language, only: %i[show edit update destroy]

  # The index action retrieves all programming languages from the database.
  # It will be used to display the list of all languages.
  def index
    @programming_languages = ProgrammingLanguage.all
  end

  # The show action shows details of a specific programming language.
  # It's used to display one language’s information.
  def show
  end

  # The new action initializes a new ProgrammingLanguage object.
  # It's used to render the form for creating a new language.
  def new
    @programming_language = ProgrammingLanguage.new
  end

  # The edit action is used to find an existing programming language and prepare
  # it for editing in a form. It's similar to the 'new' action, but for an existing language.
  def edit
  end

  # The create action handles the form submission to create a new programming language.
  # It tries to save the new programming language to the database.
  # If successful, it redirects to the show page for the newly created language.
  # If there’s an error, it re-renders the 'new' form.
  def create
    @programming_language = ProgrammingLanguage.new(programming_language_params)

    if @programming_language.save
      # If save is successful, redirect to the show page with a success notice
      redirect_to @programming_language, notice: "Programming language was successfully created."
    else
      # If save fails (e.g., validation errors), re-render the 'new' form
      render :new
    end
  end

  # The update action handles form submissions to update an existing programming language.
  # It tries to update the record with new values and redirects to the show page if successful.
  # If there’s an error, it re-renders the 'edit' form.
  def update
    if @programming_language.update(programming_language_params)
      # If update is successful, redirect to the show page with a success notice
      redirect_to @programming_language, notice: "Programming language was successfully updated."
    else
      # If update fails (e.g., validation errors), re-render the 'edit' form
      render :edit
    end
  end

  # The destroy action deletes the selected programming language from the database.
  # After deletion, it redirects back to the index page with a success notice.
  def destroy
    @programming_language.destroy
    # Redirects to the index page with a notice saying the language was successfully deleted
    redirect_to programming_languages_url, notice: "Programming language was successfully destroyed."
  end

  private

  # This private method finds the programming language by its ID.
  # It's used by the 'show', 'edit', 'update', and 'destroy' actions.
  def set_programming_language
    @programming_language = ProgrammingLanguage.find(params[:id])
  end

  # This private method ensures that only the allowed parameters (title, description, and link)
  # can be submitted when creating or updating a programming language.
  def programming_language_params
    params.require(:programming_language).permit(:title, :description, :link)
  end
end
