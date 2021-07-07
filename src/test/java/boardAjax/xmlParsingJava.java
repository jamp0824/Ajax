package boardAjax;

import org.w3c.dom.*;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.io.IOException;

class Scratch {

    public static final String PARENT_TAG_NAME = "data";

    public static void main(String[] args) {
        File xmlFile = new File("result.xml");
        Document parsedXml = null;
        try {
            parsedXml = parseXml(xmlFile);

            //recommended, http://stackoverflow.com/questions/13786607/normalization-in-dom-parsing-with-java-how-does-it-work
            parsedXml.getDocumentElement().normalize();
        } catch (ParserConfigurationException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SAXException e) {
            e.printStackTrace();
        }

        if (parsedXml != null) {
            NodeList nodeList = parsedXml.getElementsByTagName(PARENT_TAG_NAME);
            constructQueryList(nodeList);
        }
    }

    private static Document parseXml(File xmlFile)
            throws ParserConfigurationException, IOException, SAXException {

        DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder docBuilder = dbFactory.newDocumentBuilder();

        return docBuilder.parse(xmlFile);
    }

    private static void constructQueryList(NodeList dataNodes) {
        for (int i=0; i < dataNodes.getLength(); i++) {

            Node dataNode = dataNodes.item(i);
            NodeList childNodes = dataNode.getChildNodes();

            for (int j=0; j < childNodes.getLength(); j++) {

                Node childNode = childNodes.item(j);

                // Validate it's element
                if (childNode.getNodeType() == Node.ELEMENT_NODE) {

                    // get node name and value
                    System.out.println("\nNode Name=" + childNode.getNodeName());
                    System.out.println("Node Value=" + childNode.getTextContent());
                }
            }
        }
    }
}