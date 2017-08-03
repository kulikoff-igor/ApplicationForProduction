package model;

public class TAplicationData {
    private Integer idAplications;
    private String pipeType;
    private Integer pe;
    private String sdr;
    private Double pipeWall;
    private Double pipeDiametr;
    private String unit;
    private Double amount;
    private String segment;

    public void setIdAplications(Integer idAplications) {
        this.idAplications = idAplications;
    }

    public void setPipeType(String pipeType) {
        this.pipeType = pipeType;
    }

    public void setPe(Integer pe) {
        this.pe = pe;
    }

    public void setSdr(String sdr) {
        this.sdr = sdr;
    }

    public void setPipeWall(Double pipeWall) {
        this.pipeWall = pipeWall;
    }

    public void setPipeDiametr(Double pipeDiametr) {
        this.pipeDiametr = pipeDiametr;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public void setSegment(String segment) {
        this.segment = segment;
    }

    public Integer getIdAplications() {
        return idAplications;
    }

    public String getPipeType() {
        return pipeType;
    }

    public Integer getPe() {
        return pe;
    }

    public String getSdr() {
        return sdr;
    }

    public Double getPipeWall() {
        return pipeWall;
    }

    public Double getPipeDiametr() {
        return pipeDiametr;
    }

    public String getUnit() {
        return unit;
    }

    public Double getAmount() {
        return amount;
    }

    public String getSegment() {
        return segment;
    }
}
