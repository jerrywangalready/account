package com.sgcc.account.settings.model;

public class CardInfo {

    private String uuid;
    private String cardId;
    private String cardName;
    private String cardManager;
    private int cardColor;

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    public String getCardName() {
        return cardName;
    }

    public void setCardName(String cardName) {
        this.cardName = cardName;
    }

    public String getCardManager() {
        return cardManager;
    }

    public void setCardManager(String cardManager) {
        this.cardManager = cardManager;
    }

    public int getCardColor() {
        return cardColor;
    }

    public void setCardColor(int cardColor) {
        this.cardColor = cardColor;
    }
}
