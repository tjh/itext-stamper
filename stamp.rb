#!/usr/bin/env ruby

require 'java'

import java.util.HashMap;

import com.lowagie.text.Element;
import com.lowagie.text.Image;

import "java.io.FileOutputStream"
import "java.io.IOException"
import com.lowagie.text.pdf.BaseFont;

import "com.lowagie.text.pdf.PdfStamper"
import "com.lowagie.text.pdf.PdfReader"
import "com.lowagie.text.pdf.PdfWriter"
import "com.lowagie.text.Document"
import "com.lowagie.text.Paragraph"

reader = PdfReader.new("product.pdf");
stamp = PdfStamper.new(reader,
  FileOutputStream.new("product_stamped.pdf"));
  

moreInfo = HashMap.new
moreInfo.put("Author", "Name of the author");
stamp.setMoreInfo(moreInfo);

bf = BaseFont.createFont(BaseFont::HELVETICA, BaseFont::WINANSI, BaseFont::EMBEDDED);

name = ENV['NAME']

1.upto(reader.getNumberOfPages) do |page|
  over = stamp.get_over_content(page)
  over.begin_text
  # over.setFontAndSize(bf, 18);
  # over.setTextMatrix(30, 30);
  # over.showText("page - test");
  over.setFontAndSize(bf, 20);
  over.showTextAligned(Element::ALIGN_LEFT, name, 10, 10, 0);
  over.endText();
end

under = stamp.getUnderContent(1);
over = stamp.getOverContent(1);
stamp.close