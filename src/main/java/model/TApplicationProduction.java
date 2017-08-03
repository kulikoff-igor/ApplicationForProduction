package model;

/**
 * Created by IT-1 on 24.02.14.
 */
public class TApplicationProduction {
    private Integer idApplicationProduction;
    private Integer idApplication;
    private String date;
    private String acord;
    private String deliveryTime;

    public String getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(String deliveryTime) {
        this.deliveryTime = deliveryTime;
    }

    public String getAcord() {
        return acord;
    }

    public void setAcord(String acord) {
        this.acord = acord;
    }


    public Integer getIdApplicationProduction() {
        return idApplicationProduction;
    }

    public void setIdApplicationProduction(Integer idApplicationProduction) {
        this.idApplicationProduction = idApplicationProduction;
    }

    public Integer getIdApplication() {
        return idApplication;
    }

    public void setIdApplication(Integer idApplication) {
        this.idApplication = idApplication;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
