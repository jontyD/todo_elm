class TodosController < ApplicationController

  def index
    @todos = Todo.all
    respond_to do |format|
      format.json{
        render :json => @todos.to_json
      }
      format.html{}
    end
  end
end
