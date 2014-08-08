Rails.application.routes.draw do
  root "task_lists#index"

  get "task_lists/new" => "task_lists#new"
  post "task_lists" => "task_lists#create"
  get "task_lists/:id/edit" => "task_lists#edit", :as => :edit_task_list
  patch "task_lists/:id" => "task_lists#update", :as => :put_task_list
  get "task_lists/:task_list_id/show" => "task_lists#show", :as => :show_tasks
  delete "task_lists/:id" => "task_lists#delete", :as => :delete_task_list

  get "task_lists/:task_list_id/tasks/new" => "tasks#new", :as => :new_task
  post "task_lists/:task_list_id/tasks" => "tasks#create", :as => :create_task
  delete "task_lists/:task_list_id/tasks/:task_id" => "tasks#destroy", :as => :destroy_task
  get "task_lists/:task_list_id/tasks/:task_id" => "tasks#complete", :as => :completed_task
  get "task_lists/:task_list_id/completed_tasks" => "tasks#completed_tasks", :as => :completed_tasks_list


  get "about" => "sessions#about"
  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy", as: :signout

end
