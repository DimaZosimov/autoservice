package service.auto.view;

import service.auto.domain.Engine;

public class AutoUpdateRequest extends AutoRequest {
	
	private Long autoId;
	
	public AutoUpdateRequest(String brand, String model, Engine engine, String yearOfManufacture, Long milleage,
			Long autoId) {
		super(brand, model, engine, yearOfManufacture, milleage);
		this.autoId = autoId;
	}
	
	public AutoUpdateRequest() {
		super();
	}

	public Long getAutoId() {
		return autoId;
	}

	public void setAutoId(Long autoId) {
		this.autoId = autoId;
	}
	
}
