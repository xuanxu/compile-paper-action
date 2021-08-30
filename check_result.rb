paper_md_path = ARGV[0].to_s

if paper_md_path.empty?
  puts "   !! ERROR: The paper path is empty"
  exit 1
else
  paper_pdf_path = File.dirname(paper_md_path)+"/paper.pdf"
  if File.exist?(paper_pdf_path)
    puts "PDF file generated: #{paper_pdf_path}"
    `::set-output name=paper_pdf_path::#{paper_pdf_path}`
    exit 0
  else
    puts "   !! ERROR: Failed to generate PDF file"
    exit 1
  end
end