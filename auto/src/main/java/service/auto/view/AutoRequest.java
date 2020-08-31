package service.auto.view;

import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import service.auto.adapter.EngineAdapter;
import service.auto.adapter.LongAdapter;
import service.auto.domain.Engine;

public class AutoRequest {
	
	private String brand;
	private String model;
	@XmlJavaTypeAdapter(EngineAdapter.class)
	private Engine engine;
	private String yearOfManufacture;
	@XmlJavaTypeAdapter(LongAdapter.class)
	private Long milleage;
			
	public AutoRequest(String brand, String model, Engine engine, String yearOfManufacture, Long milleage) {
		this.brand = brand;
		this.model = model;
		this.engine = engine;
		this.yearOfManufacture = yearOfManufacture;
		this.milleage = milleage;
	}
		
	public AutoRequest() {
		
	}
	
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	
	public String getYearOfManufacture() {
		return yearOfManufacture;
	}
	public void setYearOfManufacture(String yearOfManufacture) {
		this.yearOfManufacture = yearOfManufacture;
	}
	public Engine getEngine() {
		return engine;
	}
	public void setEngine(Engine engine) {
		this.engine = engine;
	}
	public Long getMilleage() {
		return milleage;
	}
	public void setMilleage(Long milleage) {
		this.milleage = milleage;
	}
	
}
