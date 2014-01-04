require 'kramdown'

class MarkdownPreviewController < ApplicationController
  def convert
    markdown = Kramdown::Document.new( MarkdownPreview.preprocess_markdown( params[:markdown_text] ))
    html = markdown.to_html

    respond_to do |format|
      format.json { render :json => { :html => html } }
    end
  end

end

