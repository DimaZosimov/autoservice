package service.auto.domain;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "sv_spare_part")
public class SparePart {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "spare_part_id", nullable = false, unique = true)
	private Long sparePartId;
	@Column(name = "name", nullable = false)
	private String name;
	@ManyToOne(cascade = {CascadeType.REFRESH}, fetch = FetchType.LAZY)
	@JoinColumn(name = "auto_id")
	private Auto auto;
	@Column(name = "mileage", nullable = false)
	private Long mileage;
	@Column(name = "service_period", nullable = false)
	private Long servicePeriod;
	@Column(name = "requiring_service", nullable = false)
	private boolean requiringService;
	@Column(name = "notes")
	private String notes;
//	private Long nextService;
//	private Long using;
	
	public SparePart() {
//		this.nextService = this.mileage + this.servicePeriod;
//		this.using = this.auto.getMileage() - this.mileage;
	}

	public Long getSparePartId() {
		return sparePartId;
	}

	public void setSparePartId(Long sparePartId) {
		this.sparePartId = sparePartId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Auto getAuto() {
		return auto;
	}

	public void setAuto(Auto auto) {
		this.auto = auto;
	}

	public Long getMileage() {
		return mileage;
	}

	public void setMileage(Long mileage) {
		this.mileage = mileage;
	}

	public Long getServicePeriod() {
		return servicePeriod;
	}

	public void setServicePeriod(Long servicePeriod) {
		this.servicePeriod = servicePeriod;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

//	public Long getNextService() {
//		return nextService;
//	}
//
//	public Long getUsing() {
//		return using;
//	}

	public boolean isRequiringService() {
		return requiringService;
	}

	public void setRequiringService(boolean requiringService) {
		this.requiringService = requiringService;
	}
	
}
