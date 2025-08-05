module TasksHelper
  def task_state_class(state)
    case state
    when "doing"
      "text-danger"
    when "done"
      "text-success"
    end
  end
end
