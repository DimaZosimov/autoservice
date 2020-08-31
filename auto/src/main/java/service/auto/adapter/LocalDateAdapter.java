package service.auto.adapter;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.xml.bind.annotation.adapters.XmlAdapter;

public class LocalDateAdapter extends XmlAdapter<String, LocalDate> {

	private static final String PATTERN = "yyyy-MM-dd";

	@Override
	public LocalDate unmarshal(String v) throws Exception {
		return LocalDate.parse(v, DateTimeFormatter.ofPattern(PATTERN));
	}

	@Override
	public String marshal(LocalDate v) throws Exception {
		return v.format(DateTimeFormatter.ofPattern(PATTERN));
	}
}
