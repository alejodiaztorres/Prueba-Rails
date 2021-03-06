class TodosController < ApplicationController
    def index
        @todos = Todo.all
    end

    def new
        @todo = Todo.new
    end
    

    def create
        @todos = Todo.new(todo_params)
        @todos.save

        if @todos.save == true
            redirect_to todos_path
        else
            alert "Ingrese los campos correctramente"
            redirect_to todos_new_path
        end
    end

    def show
        @todo = Todo.find(params[:id])
    end

    def edit
        @todo = Todo.find(params[:id])
    end

    def update
        @todo = Todo.find(params[:id])
        @todo.update(todo_params)
        redirect_to todos_path
    end

    def destroy
        @todo = Todo.find(params[:id])
        @todo.destroy
        redirect_to todos_path
    end

    def complete
        @todo = Todo.find(params[:id])
        @todo.completed = true
        @todo.save
        redirect_to todos_path
    end

    def list
        @todos = Todo.all
    end
    
    
    

    private
    def todo_params
        params.require(:todo).permit(:description, :completed) 
    end
    
end
