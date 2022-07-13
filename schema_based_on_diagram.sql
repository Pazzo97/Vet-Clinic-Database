CREATE TABLE patients(
  id          SERIAL PRIMARY KEY,
  name        VARCHAR(250),
  date_of_birth date
);

CREATE TABLE invoices(
  id          SERIAL PRIMARY KEY,
  total_amount decimal,
  generated_at timestamp,
  payed_at timestamp,
  medical_history_id int,
  CONSTRAINT fk_medical_history_id  FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE medical_histories(
  id          SERIAL PRIMARY KEY,
  admitted_at timestamp,
  patient_id  int,
  status VARCHAR(250),
  CONSTRAINT fk_patient FOREIGN KEY (patient_id) REFERENCES patients (id),
);

CREATE TABLE invoice_item(
  id SERIAL PRIMARY KEY,
  unit_price decimal,
  quantity int,
  total_price decimal,
  invoice_id int,
  treatment_id int,
  CONSTRAINT fk_invoice_id FOREIGN KEY (invoice_id) REFERENCES invoices(id)
  CONSTRAINT fk_treatment_id FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

CREATE TABLE treatments(
  id SERIAL PRI KEY,
  type VARCHAR(250),
  name VARCHAR(250)
);

CREATE TABLE medical_histories_treatments(
  medical_histories_id int,
  treatments_id int,
  CONSTRAINT fk_medical_histories_id FOREIGN KEY (medical_histories_id) REFERENCES medical_histories(id),
  CONSTRAINT fk_treatments_id FOREIGN KEY (treatments_id) REFERENCES treatments(id)
);

CREATE INDEX idx_medical_histories_patient_id ON medical_histories(patient_id);
CREATE INDEX idx_invoices_medical_history_id ON invoices(medical_history_id);
CREATE INDEX idx_invoice_items_invoice_id ON invoice_items(invoice_id);
CREATE INDEX idx_invoice_items_treatment_id ON invoice_items(treatment_id);
CREATE INDEX idx_medical_histories_medical_histories_id ON medical_histories_treatments(medical_histories_id);
CREATE INDEX idx_medical_histories_treatments_id ON medical_histories_treatments(treatments_id);
