package main.controllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Arrays;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.deckfour.xes.model.XLog;
import org.processmining.log.csv.CSVFile;
import org.processmining.log.csv.CSVFileReferenceOpenCSVImpl;
import org.processmining.log.csv.config.CSVConfig;
import org.processmining.log.csvimport.CSVConversion;
import org.processmining.log.csvimport.config.CSVConversionConfig;
import org.processmining.models.graphbased.directed.petrinet.impl.PetrinetImpl;
import org.processmining.plugins.InductiveMiner.mining.MiningParametersIMf;
import org.processmining.plugins.InductiveMiner.plugins.IM;
import org.processmining.plugins.pnml.exporting.PnmlExportNetToPNML;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import utils.prom.FakePluginContext;

import javax.servlet.http.HttpServletResponse;

@RestController
public class MiningController {

    private String temporary = "/Users/massimiliano/Desktop";

    @CrossOrigin
    @RequestMapping(value = "/mine", method = RequestMethod.POST, produces = "text/xml")
    public void mine(@RequestParam("file") MultipartFile file, HttpServletResponse response) {
        try {
            File temp = new File("/Users/massimiliano/Desktop/mine.csv");
            file.transferTo(temp);

            // Convertions CSV -> XES
            CSVFile csvFile = new CSVFileReferenceOpenCSVImpl(temp.toPath());
            CSVConfig importConfig = new CSVConfig(csvFile);
            CSVConversionConfig conversionConfig = new CSVConversionConfig(csvFile, importConfig);
            conversionConfig.autoDetect();
            conversionConfig.setCaseColumns(Arrays.asList("traceid"));
            conversionConfig.setEventNameColumns(Arrays.asList("event"));
            conversionConfig.setCompletionTimeColumn("timestamp");
            CSVConversion conversion = new CSVConversion();
            CSVConversion.ConversionResult<XLog> result = conversion.doConvertCSVToXES(csvFile, importConfig,conversionConfig);
            XLog log = result.getResult();

            // Use of inductive miner
            Object[] net = IM.minePetriNet(new FakePluginContext(), log, new MiningParametersIMf());
            PetrinetImpl a = (PetrinetImpl)net[0];
            String pnmlFilePath = "/Users/massimiliano/Desktop/ciao.pnml";
            File resultFile = new File(pnmlFilePath);

            // Export pnml of the inferred model
            PnmlExportNetToPNML exporterPNML = new PnmlExportNetToPNML();
            exporterPNML.exportPetriNetToPNMLFile(new FakePluginContext(), a, resultFile);

            // Return file
            InputStream is = new FileInputStream(resultFile);
            IOUtils.copy(is, response.getOutputStream());
            response.flushBuffer();

        } catch (Exception ex) {

        }
    }

}