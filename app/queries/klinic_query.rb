class KlinicQuery
  attr_accessor :initial_scope

  def initialize(initial_scope)
    @initial_scope = initial_scope
  end

  def call(params)
    scoped = search(initial_scope, params[:name])
    if (params[:commit] == "SearchUp")
      scoped = sort(scoped, :name)
    elsif (params[:commit] == "SearchDown")
      scoped = sort(scoped, :name, :desc)
    elsif (params[:commit] == "Up2")
      scoped = sort_by_otdelenies(scoped).reverse
    elsif (params[:commit] == "Down2")
      scoped = sort_by_otdelenies(scoped)
    elsif (params[:commit] == "Up3")
      scoped = sort_by_doctors(scoped).reverse
    elsif (params[:commit] == "Down3")
      scoped = sort_by_doctors(scoped)
    end
    scoped
  end

  private def search(scoped, query = nil)
    query ? scoped.where("name LIKE '%#{query}%'") : scoped
  end

  private def sort(scoped, sort_type = :name, sort_direction = :asc)
    scoped.order(sort_type => sort_direction)
  end

  private def sort_by_otdelenies(scoped)
    scoped.sort_by(&:count_otdelenies)
  end

    private def sort_by_doctors(scoped, sort_direction = "ASC")
      scoped.sort_by(&:count_doctors)
    end

end
