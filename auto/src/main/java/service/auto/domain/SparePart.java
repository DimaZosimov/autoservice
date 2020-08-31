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
	@Column(name = "milleage", nullable = false)
	private Long milleage;
	@Column(name = "service_period", nullable = false)
	private Long servicePeriod;
	@Column(name = "requiring_service", nullable = false)
	private boolean requiringService;
	@Column(name = "notes")
	private String notes;
//	private Long nextService;
//	private Long using;
	
	public SparePart() {
//		this.nextService = this.milleage + this.servicePeriod;
//		this.using = this.auto.getMilleage() - this.milleage;
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

	public Long getMilleage() {
		return milleage;
	}

	public void setMilleage(Long milleage) {
		this.milleage = milleage;
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

	@Override
	public String toString() {
		return "SparePart [sparePartId=" + sparePartId + ", name=" + name + ", auto=" + auto + ", milleage=" + milleage
				+ ", servicePeriod=" + servicePeriod + ", requiringService=" + requiringService 
				+ "]";
	}
	
	
	
}
