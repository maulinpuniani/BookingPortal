package com.my.spring.controller;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

public class PdfReportView extends AbstractPdfView {

	@Override
	protected void buildPdfDocument(Map<String, Object> model, Document pdfdoc, PdfWriter pdfwriter,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//model was added to the scope by the Controller
		String depflightNo = (String) model.get("depflightNo");
		String depsource = (String) model.get("depsource");
		String depdest = (String) model.get("depdest");
		String depdep = (String) model.get("depdep");
		String deparival = (String) model.get("deparival");
		String customerName = (String) model.get("name");
		String retflightNo = (String) model.get("retflightNo");
		String retarival="",retdep="",retsrc="",retdest="";
		
		if(retflightNo != "") {
			 retarival = (String) model.get("retarival");
			 retdep = (String) model.get("retdep");
			 retsrc = (String) model.get("retsrc");
			 retdest = (String) model.get("retdest");

			
		}
		
		
		PdfPTable table = new PdfPTable(5);
        table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
        table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);

        //table.addCell("Customer Name");
        table.addCell("Departure Flight No");
        table.addCell("Source");
        table.addCell("Destination");
        table.addCell("Depature");
        table.addCell("Arrival");
//        if(retflightNo != "") {
//        	table.addCell("Return Flight No");
//            table.addCell("Source");
//            table.addCell("Destination");
//            table.addCell("Depature");
//            table.addCell("Arrival");
//        }
        //table.addCell(customerName);
        table.addCell(depflightNo);
        table.addCell(depsource);
        table.addCell(depdest);
        table.addCell(depdep);
        table.addCell(deparival);
//        if(retflightNo != "") {
//        	table.addCell(retflightNo);
//            table.addCell(retsrc);
//            table.addCell(retdest);
//            table.addCell(retdep);
//            table.addCell(retarival);
//        }
        PdfPTable table2 = new PdfPTable(5);
        table2.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
        table2.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);

        if(retflightNo != "") {
        	table2.addCell("Return Flight No");
        	table2.addCell("Source");
        	table2.addCell("Destination");
        	table2.addCell("Depature");
        	table2.addCell("Arrival");
        }
        if(retflightNo != "") {
        	table2.addCell(retflightNo);
        	table2.addCell(retsrc);
        	table2.addCell(retdest);
        	table2.addCell(retdep);
        	table2.addCell(retarival);
        }
        //pdfdoc.add(new Paragraph("Item Name: " + itemName + " " +"customerName:"+customerName));
      pdfdoc.add(new Paragraph("Congratulations "+"CustomerName: "+customerName+" your Booking is Confirmed!!"));
      pdfdoc.add(new Paragraph(" "));
        pdfdoc.add(table);
        
        pdfdoc.add(table2);
	}

	

}



