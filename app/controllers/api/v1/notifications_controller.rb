# Processa as notificações enviadas por outros microsserviços
class Api::V1::NotificationsController < ApplicationController
  # POST /
  def create
    task = create_or_update
    render json: {task:}, status: :ok
  rescue => error
    render json: {error: error.message}, status: :bad_request
  end

  private

  def create_or_update
    (params[:task][:action] == "create") ? create_task : update_task
  end

  def create_task
    task = Task.create!(task_params)
    task.notifications.create!(notification_params)
    task
  end

  def update_task
    Task.find_by(uuid: task_params[:uuid]).tap do |task|
      task.update_column(:url, task_params[:url]) if task_params[:url]
      task.notifications.create!(notification_params)
    end
  end

  def task_params
    params.require(:task).permit(:uuid, :user, :url)
  end

  def notification_params
    params.require(:notification).permit(:info, data: {})
  end
end
