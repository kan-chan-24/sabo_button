class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "タスクを登録しました"
    else
      @tasks = Task.all
      render :index
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "タスクを削除しました"
  end

  def timer # タイマー起動
    @task = Task.find(params[:id])
  end

  def complete # タイマー完了
    @task = Task.find(params[:id])
    @task.increment!(:completion_count)
    redirect_to history_task_path(@task)
  end

  def history # 完了履歴
    @task = Task.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end
end
