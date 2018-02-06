package com.fogsoft.mymoney.service;

public class MessageBean {
	private MessageType type;
	private String text;

	public MessageBean(MessageType type, String text) {
		super();
		this.type = type;
		this.text = text;
	}

	public MessageType getType() {
		return type;
	}

	public void setType(MessageType type) {
		this.type = type;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
}
