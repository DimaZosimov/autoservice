package service.auto.view;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import service.auto.adapter.EngineAdapter;
import service.auto.adapter.LongAdapter;
import service.auto.domain.Engine;

public class AutoRequest {
	
	private final static String BRAND = "[A-Za-zА-Яа-я]+";
	private final static String MODEL = "\\w+";
	private final static String YEAR_OF_MANUF = "[0-9]{4}";
	
	@NotBlank(message = "{notBlank.autoRequest}")
	@Pattern(regexp = BRAND, message = "{pattern.autoRequest}")
	private String brand;
	@NotBlank(message = "{notBlank.autoRequest}")
	@Pattern(regexp = MODEL, message = "{pattern.autoRequest}")
	private String model;
	@XmlJavaTypeAdapter(EngineAdapter.class)
	private Engine engine;
	@NotBlank(message = "{notBlank.autoRequest}")
	@Pattern(regexp = YEAR_OF_MANUF, message = "{pattern.autoRequest}")
	private String yearOfManufacture;
	@Digits(fraction = 0, integer = 7, message = "{digits.autoRequest.milleage}")
	@NotNull(message = "{notBlank.autoRequest}")
	@XmlJavaTypeAdapter(LongAdapter.class)
	private Long mileage;
			
	public AutoRequest(String brand, String model, Engine engine, String yearOfManufacture, Long mileage) {
		this.brand = brand;
		this.model = model;
		this.engine = engine;
		this.yearOfManufacture = yearOfManufacture;
		this.mileage = mileage;
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
	public Long getMileage() {
		return mileage;
	}
	public void setMileage(Long mileage) {
		this.mileage = mileage;
	}
	
}
