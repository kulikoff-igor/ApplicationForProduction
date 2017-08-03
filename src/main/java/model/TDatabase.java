package model;

import java.util.Date;


public class TDatabase {
    private Integer idApplication;
    private Date date;
    private String organization;
    private String terms;
    private String performer;

    public Integer getIdApplication() {
        return idApplication;
    }

    public void setIdApplication(Integer idApplication) {
        this.idApplication = idApplication;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getOrganization() {
        return organization;
    }

    public void setOrganization(String organization) {
        this.organization = organization;
    }

    public String getTerms() {
        return terms;
    }

    public void setTerms(String terms) {
        this.terms = terms;
    }

    public String getPerformer() {
        return performer;
    }

    public void setPerformer(String performer) {
        this.performer = performer;
    }
}
