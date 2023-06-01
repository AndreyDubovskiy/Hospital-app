# frozen_string_literal: true

class CardPacientQuery
  attr_accessor :initial_scope

  def initialize(initial_scope)
    @initial_scope = initial_scope
  end

  def call(params)
    scoped = initial_scope.joins(:pacient).group('id')
    scoped = search_name_surname(scoped, params[:name])
    scoped = search_age(scoped, params[:age])
    scoped = search_phone(scoped, params[:phone])
    if (params[:commit] == "SearchUp1")
      scoped = sort_by_name_surname(scoped)
    elsif (params[:commit] == "SearchDown1")
      scoped = sort_by_name_surname(scoped,"DESC")
    elsif (params[:commit] == "SearchUp2")
      scoped = sort_by_age(scoped)
    elsif (params[:commit] == "SearchDown2")
      scoped = sort_by_age(scoped, "DESC")
    elsif (params[:commit] == "SearchUp3")
      scoped = sort_by_phone(scoped)
    elsif (params[:commit] == "SearchDown3")
      scoped = sort_by_phone(scoped, "DESC")
    end
    scoped
  end

  private def search_name_surname(scoped, query = nil)
    (query != nil and query != "") ? scoped.where("pacients.name || ' ' || pacients.surname LIKE ?", "%#{query}%") : scoped
  end

  private def search_age(scoped, query = nil)
    (query != nil and query != "") ? scoped.where("pacients.age = #{query.to_i}") : scoped
  end

  private def search_phone(scoped, query = nil)
    (query != nil and query != "") ? scoped.where("pacients.phone LIKE '%#{query}%'") : scoped
  end

  private def sort_by_name_surname(scoped, direction = "ASC")
    scoped.joins(:pacient).order("pacients.name #{direction}, pacients.surname #{direction}")
  end

  private def sort_by_age(scoped, direction = "ASC")
    scoped.joins(:pacient).order("pacients.age #{direction}")
  end

  private def sort_by_phone(scoped, direction = "ASC")
    scoped.joins(:pacient).order("pacients.phone #{direction}")
  end

end
