class BootstrapPaginationRenderer < WillPaginate::ActionView::LinkRenderer
  def container_attributes
    { class: 'pagination justify-content-center' }
  end

  def page_number(page)
    if page == current_page
      '<li class="page-item active"><span class="page-link">' + page.to_s + '</span></li>'
    else
      '<li class="page-item">' + link(page, page, class: 'page-link') + '</li>'
    end
  end

  def previous_page
    num = @collection.current_page > 1 && @collection.current_page - 1
    previous_or_next_page(num, '← 前へ')
  end

  def next_page
    num = @collection.current_page < total_pages && @collection.current_page + 1
    previous_or_next_page(num, '次へ →')
  end

  def previous_or_next_page(page, text)
    if page
      '<li class="page-item">' + link(text, page, class: 'page-link') + '</li>'
    else
      '<li class="page-item disabled"><span class="page-link">' + text + '</span></li>'
    end
  end
end
