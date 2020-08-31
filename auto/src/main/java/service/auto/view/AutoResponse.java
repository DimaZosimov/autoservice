package service.auto.view;

import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import service.auto.adapter.EngineAdapter;
import service.auto.adapter.LongAdapter;

public class AutoResponse {
		
	private Long autoId;
	private String brand;
	private String model;
	@XmlJavaTypeAdapter(value = EngineAdapter.class)
	private String engine;
	private String yearOfManufacture;
	@XmlJavaTypeAdapter(LongAdapter.class)
	private Long milleage;
		
	public AutoResponse(Long autoId, String brand, String model, String engine, String yearOfManufacture, Long milleage) {
		this.autoId = autoId;
		this.brand = brand;
		this.model = model;
		this.engine = engine;
		this.yearOfManufacture = yearOfManufacture;
		this.milleage = milleage;
	}
	
	public Long getAutoId() {
		return autoId;
	}

	public void setAutoId(Long autoId) {
		this.autoId = autoId;
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
	public String getEngine() {
		return engine;
	}
	public void setEngine(String engine) {
		this.engine = engine;
	}
	public String getYearOfManufacture() {
		return yearOfManufacture;
	}
	public void setYearOfManufacture(String yearOfManufacture) {
		this.yearOfManufacture = yearOfManufacture;
	}
	public Long getMilleage() {
		return milleage;
	}
	public void setMilleage(Long milleage) {
		this.milleage = milleage;
	}
	
}
