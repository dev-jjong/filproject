package com.filproject.admin.common;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SiteMeshFilter extends ConfigurableSiteMeshFilter {
	private static final Logger logger = LoggerFactory
			.getLogger(SiteMeshFilter.class);

	@Override
	protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
		logger.debug("applyCustomConfiguration");

		final String path = "/WEB-INF/views/_decorators/";
		SiteMeshDecoratorSelector decoratorSelector = new SiteMeshDecoratorSelector();

		decoratorSelector.putMapping(SiteMeshDecoratorSelector.DEFAULT, path
				+ "default.jsp");
//		decoratorSelector.putMapping(SiteMeshDecoratorSelector.MOBILE, path
//				+ "default.jsp");
//		decoratorSelector.putMapping(SiteMeshDecoratorSelector.TABLET, path
//				+ "default.jsp");

//		decoratorSelector.put("*/pop/*", path + "popup.jsp");
//		decoratorSelector.put("*/img.do*", path + "dextpopup.jsp");
		decoratorSelector.put("/main.do", path + "main.jsp");
//		decoratorSelector.put("/display/curationGoodsRegist", path + "popup.jsp");
//		decoratorSelector.put("/display/curationGoodsEdit", path + "popup.jsp");


		// Assign
		builder.setCustomDecoratorSelector(decoratorSelector)
				.addExcludedPath("/resources/*")
				.addExcludedPath("*Ajax*")
				.addExcludedPath("/login*")
				.addExcludedPath("*Proc*")
				.addExcludedPath("/index.jsp");
	}

}
// EOF