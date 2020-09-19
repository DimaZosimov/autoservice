package service.auto.view;

import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import service.auto.adapter.LongAdapter;

public class MainAutoRequest {
	
	@XmlJavaTypeAdapter(LongAdapter.class)
	private Long mainAutoId;

	public MainAutoRequest(Long mainAutoId) {
		this.mainAutoId = mainAutoId;
	}
	
	public MainAutoRequest() {
		
	}

	public Long getMainAutoId() {
		return mainAutoId;
	}

	public void setMainAutoId(Long mainAutoId) {
		this.mainAutoId = mainAutoId;
	}
	
	

}
