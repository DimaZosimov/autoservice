package service.auto.adapter;

import javax.xml.bind.annotation.adapters.XmlAdapter;

import service.auto.domain.Engine;

public class EngineAdapter extends XmlAdapter<String, Engine>{

	@Override
	public Engine unmarshal(String v) throws Exception {
		switch (v) {
		case "PETROL" : return Engine.PETROL;
		case "DIESEL" : return Engine.DIESEL;
		default		  : return Engine.ELECTRIC;
		}
	}

	@Override
	public String marshal(Engine v) throws Exception {
		return v.name();
	}

}
