paper_md_path = ARGV[0].to_s

if paper_md_path.empty?
  raise "   !! ERROR: The paper path is empty"
else
  paper_pdf_path = File.dirname(paper_md_path)+"/paper.pdf"
  if File.exist?(paper_pdf_path)
    puts paper_pdf_path
  else
    raise "   !! ERROR: Failed to generate PDF file"
  end
end
