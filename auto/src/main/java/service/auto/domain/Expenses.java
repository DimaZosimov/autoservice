package service.auto.domain;

import java.time.LocalDate;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "sv_expenses")
public class Expenses {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long expensesId;
	@ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.LAZY)
	@JoinColumn(name = "auto_id")
	private Auto auto;
	@Column(name = "expense_type", nullable = false)
	@Enumerated
	private ExpenseType expenseType;
	@Column(name = "unit", nullable = false)
	@Enumerated
	private Unit unit;
	@Column(name = "quantity", nullable = false)
	private Long quantity;
	@Column(name = "cost", nullable = false)
	private Long cost;
	@Column(name = "date")
	private LocalDate date;
	
	public Long getExpensesId() {
		return expensesId;
	}
	public void setExpensesId(Long expensesId) {
		this.expensesId = expensesId;
	}
	public Auto getAuto() {
		return auto;
	}
	public void setAuto(Auto auto) {
		this.auto = auto;
	}
	public ExpenseType getExpenseType() {
		return expenseType;
	}
	public void setExpenseType(ExpenseType expenseType) {
		this.expenseType = expenseType;
	}
	public Unit getUnit() {
		return unit;
	}
	public void setUnit(Unit unit) {
		this.unit = unit;
	}
	public Long getQuantity() {
		return quantity;
	}
	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}
	public Long getCost() {
		return cost;
	}
	public void setCost(Long cost) {
		this.cost = cost;
	}
	public LocalDate getDate() {
		return date;
	}
	public void setDate(LocalDate date) {
		this.date = date;
	}
	
}
