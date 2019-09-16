package com.tdoer.coredata.framework.obj.product;

import com.tdoer.bedrock.impl.definition.product.ClientContextDefinition;
import java.util.Date;

public class ClientContextObj extends ClientContextDefinition {
    private Long id;

    private String entryAppId;

    private String enabled;

    private String createdBy;

    private Date createdAt;

    private String updatedBy;

    private Date updatedAt;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEntryAppId() {
        return entryAppId;
    }

    public void setEntryAppId(String entryAppId) {
        this.entryAppId = entryAppId == null ? null : entryAppId.trim();
    }

    public String getEnabled() {
        return enabled;
    }

    public void setEnabled(String enabled) {
        this.enabled = enabled == null ? null : enabled.trim();
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy == null ? null : createdBy.trim();
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy == null ? null : updatedBy.trim();
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }
}