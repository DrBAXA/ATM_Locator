package com.ss.atmlocator.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Set;

/**
 * Created by Olavin on 18.11.2014.
 */
@Entity
@Table(name="banks")
public class Bank {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int Id;

    @Column
    private String name;

    @Column
    private String webSite;

    @Column
    private String logo;

    @Column
    private String iconAtm;

    @Column
    private String iconOffice;

    @Column
    private Timestamp lastUpdated;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "bank")
    private Set<AtmOffice> atmOfficeSet;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "bank")
    private Set<AtmParser> atmParserSet;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "network_id")
    private AtmNetwork network;

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getWebSite() {
        return webSite;
    }

    public void setWebSite(String webSite) {
        this.webSite = webSite;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getIconAtm() {
        return iconAtm;
    }

    public void setIconAtm(String iconAtm) {
        this.iconAtm = iconAtm;
    }

    public String getIconOffice() {
        return iconOffice;
    }

    public void setIconOffice(String iconOffice) {
        this.iconOffice = iconOffice;
    }

    public Timestamp getLastUpdated() {
        return lastUpdated;
    }

    public void setLastUpdated(Timestamp lastUpdated) {
        this.lastUpdated = lastUpdated;
    }

    public Set<AtmOffice> getAtmOfficeSet() {
        return atmOfficeSet;
    }

    public void setAtmOfficeSet(Set<AtmOffice> atmOfficeSet) {
        this.atmOfficeSet = atmOfficeSet;
    }

    public AtmNetwork getNetwork() {
        return network;
    }

    public void setNetwork(AtmNetwork network) {
        this.network = network;
    }
}
