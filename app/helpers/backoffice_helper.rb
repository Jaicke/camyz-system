module BackofficeHelper
  def boolean_label(item)
    if item
      "<span class='badge badge-success'>Sim</span>".html_safe
    else
      "<span class='badge badge-danger'>Não</span>".html_safe
    end
  end
end
