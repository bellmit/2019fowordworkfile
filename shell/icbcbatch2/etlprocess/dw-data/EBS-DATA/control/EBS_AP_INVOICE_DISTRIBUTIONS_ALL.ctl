OPTIONS (skip=1)
LOAD DATA
INFILE "/dw-data/EBS-DATA/20190328/csv/20190328_ap_invoice_distributions_all_201903.csv"
truncate
INTO TABLE EBS_AP_INVOICE_DISTRIBUTIONS_ALL
fields terminated by "^*"
Optionally enclosed by '"'
trailing nullcols
(
  report_id										,
  ACCOUNTING_DATE               				DATE"DD-MM-YY",
  ACCRUAL_POSTED_FLAG           				,
  ASSETS_ADDITION_FLAG          				,
  ASSETS_TRACKING_FLAG          				,
  CASH_POSTED_FLAG              				,
  DISTRIBUTION_LINE_NUMBER      				,
  DIST_CODE_COMBINATION_ID      				,
  INVOICE_ID                    				,
  LAST_UPDATED_BY               				,
  LAST_UPDATE_DATE              				DATE"DD-MM-YY",
  LINE_TYPE_LOOKUP_CODE         				,
  PERIOD_NAME                   				,
  SET_OF_BOOKS_ID               				,
  ACCTS_PAY_CODE_COMBINATION_ID 				,
  AMOUNT                        				,
  BASE_AMOUNT                   				,
  BASE_INVOICE_PRICE_VARIANCE   				,
  BATCH_ID                      				,
  CREATED_BY                    				,
  CREATION_DATE                 				DATE"DD-MM-YY",
  DESCRIPTION                   				,
  EXCHANGE_RATE_VARIANCE        				,
  FINAL_MATCH_FLAG              				,
  INCOME_TAX_REGION             				,
  INVOICE_PRICE_VARIANCE        				,
  LAST_UPDATE_LOGIN             				,
  MATCH_STATUS_FLAG             				,
  POSTED_FLAG                   				,
  PO_DISTRIBUTION_ID            				,
  PROGRAM_APPLICATION_ID        				,
  PROGRAM_ID                    				,
  PROGRAM_UPDATE_DATE           				DATE"DD-MM-YY",
  QUANTITY_INVOICED             				,
  RATE_VAR_CODE_COMBINATION_ID  				,
  REQUEST_ID                    				,
  REVERSAL_FLAG                 				,
  TYPE_1099                     				,
  UNIT_PRICE                    				,
  AMOUNT_ENCUMBERED             				,
  BASE_AMOUNT_ENCUMBERED        				,
  ENCUMBERED_FLAG               				,
  EXCHANGE_DATE                 				DATE"DD-MM-YY",
  EXCHANGE_RATE                 				,
  EXCHANGE_RATE_TYPE            				,
  PRICE_ADJUSTMENT_FLAG         				,
  PRICE_VAR_CODE_COMBINATION_ID 				,
  QUANTITY_UNENCUMBERED         				,
  STAT_AMOUNT                   				,
  AMOUNT_TO_POST                				,
  ATTRIBUTE1                    				,
  ATTRIBUTE10                   				,
  ATTRIBUTE11                   				,
  ATTRIBUTE12                   				,
  ATTRIBUTE13                   				,
  ATTRIBUTE14                   				,
  ATTRIBUTE15                   				,
  ATTRIBUTE2                    				,
  ATTRIBUTE3                    				,
  ATTRIBUTE4                    				,
  ATTRIBUTE5                    				,
  ATTRIBUTE6                    				,
  ATTRIBUTE7                    				,
  ATTRIBUTE8                    				,
  ATTRIBUTE9                    				,
  ATTRIBUTE_CATEGORY            				,
  BASE_AMOUNT_TO_POST           				,
  CASH_JE_BATCH_ID              				,
  EXPENDITURE_ITEM_DATE         				DATE"DD-MM-YY",
  EXPENDITURE_ORGANIZATION_ID   				,
  EXPENDITURE_TYPE              				,
  JE_BATCH_ID                   				,
  PARENT_INVOICE_ID             				,
  PA_ADDITION_FLAG              				,
  PA_QUANTITY                   				,
  POSTED_AMOUNT                 				,
  POSTED_BASE_AMOUNT            				,
  PREPAY_AMOUNT_REMAINING       				,
  PROJECT_ACCOUNTING_CONTEXT    				,
  PROJECT_ID                    				,
  TASK_ID                       				,
  USSGL_TRANSACTION_CODE        				,
  USSGL_TRX_CODE_CONTEXT        				,
  EARLIEST_SETTLEMENT_DATE      				DATE"DD-MM-YY",
  REQ_DISTRIBUTION_ID           				,
  QUANTITY_VARIANCE             				,
  BASE_QUANTITY_VARIANCE        				,
  PACKET_ID                     				,
  AWT_FLAG                      				,
  AWT_GROUP_ID                  				,
  AWT_TAX_RATE_ID               				,
  AWT_GROSS_AMOUNT              				,
  AWT_INVOICE_ID                				,
  AWT_ORIGIN_GROUP_ID           				,
  REFERENCE_1                   				,
  REFERENCE_2                   				,
  ORG_ID                        				,
  OTHER_INVOICE_ID              				,
  AWT_INVOICE_PAYMENT_ID        				,
  GLOBAL_ATTRIBUTE_CATEGORY     				,
  GLOBAL_ATTRIBUTE1             				,
  GLOBAL_ATTRIBUTE2             				,
  GLOBAL_ATTRIBUTE3             				,
  GLOBAL_ATTRIBUTE4             				,
  GLOBAL_ATTRIBUTE5             				,
  GLOBAL_ATTRIBUTE6             				,
  GLOBAL_ATTRIBUTE7             				,
  GLOBAL_ATTRIBUTE8             				,
  GLOBAL_ATTRIBUTE9             				,
  GLOBAL_ATTRIBUTE10            				,
  GLOBAL_ATTRIBUTE11            				,
  GLOBAL_ATTRIBUTE12            				,
  GLOBAL_ATTRIBUTE13            				,
  GLOBAL_ATTRIBUTE14            				,
  GLOBAL_ATTRIBUTE15            				,
  GLOBAL_ATTRIBUTE16            				,
  GLOBAL_ATTRIBUTE17            				,
  GLOBAL_ATTRIBUTE18            				,
  GLOBAL_ATTRIBUTE19            				,
  GLOBAL_ATTRIBUTE20            				,
  LINE_GROUP_NUMBER             				,
  RECEIPT_VERIFIED_FLAG         				,
  RECEIPT_REQUIRED_FLAG         				,
  RECEIPT_MISSING_FLAG          				,
  JUSTIFICATION                 				,
  EXPENSE_GROUP                 				,
  START_EXPENSE_DATE            				DATE"DD-MM-YY",
  END_EXPENSE_DATE              				DATE"DD-MM-YY",
  RECEIPT_CURRENCY_CODE         				,
  RECEIPT_CONVERSION_RATE       				,
  RECEIPT_CURRENCY_AMOUNT       				,
  DAILY_AMOUNT                  				,
  WEB_PARAMETER_ID              				,
  ADJUSTMENT_REASON             				,
  AWARD_ID                      				,
  MRC_ACCRUAL_POSTED_FLAG       				,
  MRC_CASH_POSTED_FLAG          				,
  MRC_DIST_CODE_COMBINATION_ID  				,
  MRC_AMOUNT                    				,
  MRC_BASE_AMOUNT               				,
  MRC_BASE_INV_PRICE_VARIANCE   				,
  MRC_EXCHANGE_RATE_VARIANCE    				,
  MRC_POSTED_FLAG               				,
  MRC_PROGRAM_APPLICATION_ID    				,
  MRC_PROGRAM_ID                				,
  MRC_PROGRAM_UPDATE_DATE       				DATE"DD-MM-YY",
  MRC_RATE_VAR_CCID             				,
  MRC_REQUEST_ID                				,
  MRC_EXCHANGE_DATE             				DATE"DD-MM-YY",
  MRC_EXCHANGE_RATE             				,
  MRC_EXCHANGE_RATE_TYPE        				,
  MRC_AMOUNT_TO_POST            				,
  MRC_BASE_AMOUNT_TO_POST       				,
  MRC_CASH_JE_BATCH_ID          				,
  MRC_JE_BATCH_ID               				,
  MRC_POSTED_AMOUNT             				,
  MRC_POSTED_BASE_AMOUNT        				,
  MRC_RECEIPT_CONVERSION_RATE   				,
  CREDIT_CARD_TRX_ID            				,
  DIST_MATCH_TYPE               				,
  RCV_TRANSACTION_ID            				,
  INVOICE_DISTRIBUTION_ID       				,
  PARENT_REVERSAL_ID            				,
  TAX_RECOVERABLE_FLAG          				,
  PA_CC_AR_INVOICE_ID           				,
  PA_CC_AR_INVOICE_LINE_NUM     				,
  PA_CC_PROCESSED_CODE          				,
  MERCHANT_DOCUMENT_NUMBER      				,
  MERCHANT_NAME                 				,
  MERCHANT_REFERENCE            				,
  MERCHANT_TAX_REG_NUMBER       				,
  MERCHANT_TAXPAYER_ID          				,
  COUNTRY_OF_SUPPLY             				,
  MATCHED_UOM_LOOKUP_CODE       				,
  GMS_BURDENABLE_RAW_COST       				,
  ACCOUNTING_EVENT_ID           				,
  PREPAY_DISTRIBUTION_ID        				,
  UPGRADE_POSTED_AMT            				,
  UPGRADE_BASE_POSTED_AMT       				,
  INVENTORY_TRANSFER_STATUS     				,
  COMPANY_PREPAID_INVOICE_ID    				,
  CC_REVERSAL_FLAG              				,
  AWT_WITHHELD_AMT              				,
  INVOICE_INCLUDES_PREPAY_FLAG  				,
  PRICE_CORRECT_INV_ID          				,
  PRICE_CORRECT_QTY             				,
  PA_CMT_XFACE_FLAG             				,
  CANCELLATION_FLAG             				,
  INVOICE_LINE_NUMBER           				,
  CORRECTED_INVOICE_DIST_ID     				,
  ROUNDING_AMT                  				,
  CHARGE_APPLICABLE_TO_DIST_ID  				,
  CORRECTED_QUANTITY            				,
  RELATED_ID                    				,
  ASSET_BOOK_TYPE_CODE          				,
  ASSET_CATEGORY_ID             				,
  DISTRIBUTION_CLASS            				,
  FINAL_PAYMENT_ROUNDING        				,
  FINAL_APPLICATION_ROUNDING    				,
  AMOUNT_AT_PREPAY_XRATE        				,
  CASH_BASIS_FINAL_APP_ROUNDING 				,
  AMOUNT_AT_PREPAY_PAY_XRATE    				,
  INTENDED_USE                  				,
  DETAIL_TAX_DIST_ID            				,
  REC_NREC_RATE                 				,
  RECOVERY_RATE_ID              				,
  RECOVERY_RATE_NAME            				,
  RECOVERY_TYPE_CODE            				,
  RECOVERY_RATE_CODE            				,
  WITHHOLDING_TAX_CODE_ID       				,
  TAX_ALREADY_DISTRIBUTED_FLAG  				,
  SUMMARY_TAX_LINE_ID           				,
  TAXABLE_AMOUNT                				,
  TAXABLE_BASE_AMOUNT           				,
  EXTRA_PO_ERV                  				,
  PREPAY_TAX_DIFF_AMOUNT        				,
  TAX_CODE_ID                   				,
  VAT_CODE                      				,
  AMOUNT_INCLUDES_TAX_FLAG      				,
  TAX_CALCULATED_FLAG           				,
  TAX_RECOVERY_RATE             				,
  TAX_RECOVERY_OVERRIDE_FLAG    				,
  TAX_CODE_OVERRIDE_FLAG        				,
  TOTAL_DIST_AMOUNT             				,
  TOTAL_DIST_BASE_AMOUNT        				,
  PREPAY_TAX_PARENT_ID          				,
  CANCELLED_FLAG                				,
  OLD_DISTRIBUTION_ID           				,
  OLD_DIST_LINE_NUMBER          				,
  AMOUNT_VARIANCE               				,
  BASE_AMOUNT_VARIANCE          				,
  HISTORICAL_FLAG               				,
  RCV_CHARGE_ADDITION_FLAG      				,
  AWT_RELATED_ID                				,
  RELATED_RETAINAGE_DIST_ID     				,
  RETAINED_AMOUNT_REMAINING     				,
  BC_EVENT_ID                   				,
  RETAINED_INVOICE_DIST_ID      				,
  FINAL_RELEASE_ROUNDING        				,
  FULLY_PAID_ACCTD_FLAG         				,
  ROOT_DISTRIBUTION_ID          				,
  XINV_PARENT_REVERSAL_ID       				,
  RECURRING_PAYMENT_ID          				,
  RELEASE_INV_DIST_DERIVED_FROM 				,
  PAY_AWT_GROUP_ID              				,
data_date  "(select data_date from etl_control.ctl_general_parameter)",
etl_date "sysdate "
)
