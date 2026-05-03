class TasksController < ApplicationController
  before_action :set_task, only: [ :destroy, :timer, :complete, :history ]

  def index
    # 現在のユーザー識別子に紐づいたタスクのみ取得
    @tasks = Task.where(user_identifier: current_identifier)
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_identifier = current_identifier # ユーザー識別子を設定

    if @task.save
      redirect_to tasks_path, notice: "タスクを登録しました"
    else
      @tasks = Task.where(user_identifier: current_identifier)
      render :index
    end
  end

  def destroy
    # set_task で取得済み
    @task.destroy
    redirect_to tasks_path, notice: "タスクを削除しました"
  end

  def timer # タイマー起動
    # set_task で取得済み
  end

  def complete # タイマー完了
    # set_task で取得済み
    @task.increment!(:completion_count)
    redirect_to history_task_path(@task)
  end

  def history # 完了履歴
    # set_task で取得済み
  end

  private

  def set_task
    # 現在のユーザー識別子に紐づいたタスクのみ取得（セキュリティ対策）
    @task = Task.find_by!(id: params[:id], user_identifier: current_identifier)
  rescue ActiveRecord::RecordNotFound
    redirect_to tasks_path, alert: "タスクが見つかりませんでした"
  end

  def task_params
    params.require(:task).permit(:name)
  end
end
