<?xml version="1.0" encoding="UTF-8"?>
<Form xmlVersion="20170720" releaseVersion="10.0.0">
<TableDataMap>
<TableData name="ds1" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[FRDemo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT * FROM 总公司面板]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="ds2" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="c"/>
<O>
<![CDATA[江苏分公司]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[FRDemo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT * FROM 总公司面板 where 分公司='${c}']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="ds3" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="c"/>
<O>
<![CDATA[江苏分公司]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[FRDemo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT * FROM 总公司品牌 where 分公司='${c}']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="ds4" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="c"/>
<O>
<![CDATA[江苏分公司]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[FRDemo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT * FROM 总公司车系 where 公司='${c}' order by 销量]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="ds5" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="c"/>
<O>
<![CDATA[江苏分公司]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[FRDemo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT * FROM 总公司员工 where 公司='${c}']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="ds6" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="c"/>
<O>
<![CDATA[江苏分公司]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[FRDemo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT * FROM 总公司月份  where 分公司='${c}']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="ds7" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="c"/>
<O>
<![CDATA[江苏分公司]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[FRDemo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT * FROM 总公司影响因素 where 分公司='${c}']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="ds8" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="c"/>
<O>
<![CDATA[江苏分公司]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[FRDemo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT * FROM 总公司销售分析 where 分公司='${c}']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="Embedded1" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[立项名称,,.,,立项数量]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String">
<![CDATA[HbR)gjhdRCS47*;>gL6&,>M/nF"#e1e(E.aau8380f"?d9f\3X/>-f8TXZ]AV~
]]></RowData>
</TableData>
<TableData name="Embedded2" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[公司名称,,.,,销售额,,.,,目标值]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String,java.lang.String]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String,java.lang.String">
<![CDATA[Hb+XnZQ4+ZG-jDL?1YFQ#H*uX\V3&AK`Ma(4l&<r`UnV4S>h@5\N-Q*=RO;6M(c;R7?Xu2YQ
W+:!p'C~
]]></RowData>
</TableData>
<TableData name="Embedded3" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[存量金额,,.,,款项金额]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String">
<![CDATA[Hb+XSo@;YM([cZ/B@YJao/KH<NQk/,?8h.s2J53QaNW/Xe/SG~
]]></RowData>
</TableData>
<TableData name="Embedded4" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[公司名称,,.,,今年合同总额,,.,,去年合同总额]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String,java.lang.String]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String,java.lang.String">
<![CDATA[Hb+XnZQ4+ZG-jDL?1YFQ#H+Q3JUmj"W@<qiHEq>GM_/-FEb5Lu3>5&Igsb,o-TfmCS[79hcR
pIX+FTb&,7FP~
]]></RowData>
</TableData>
<TableData name="Embedded5" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[公司名称,,.,,实际完成时间,,.,,计划完成时间]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String,java.lang.String]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String,java.lang.String">
<![CDATA[Ha7GHe)'=b45-:7Y'Ja9K@?(6K^7mr\^,HC7>R@QRW1LD[H?/.V$JeC,>LT.!!~
]]></RowData>
</TableData>
<TableData name="员工离职率" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[公司部门,,.,,入职人数,,.,,离职人数,,.,,总人数,,.,,离职率]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String,java.lang.String,java.lang.String,java.lang.String]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String,java.lang.String,java.lang.String,java.lang.String">
<![CDATA[29eDo_CuN)cuj@G8^bQKM2G\0$!?"#KJ!U;AQ)!R<%l^gUpk;PQ+rg/s+>3I/e%[jSg!p]A\8
#0_k"H[?At#X,9t#nmNcpUX&kYGhE-NqM"k'YZA24ja>D`q75^>r12$Q,O;K>ENW'&]A7\il:
#-:O+JP;!uge*ecST&+,jrefk[mS.MAs/g3*RL]A~
]]></RowData>
</TableData>
<TableData name="Embedded6" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[立项名称,,.,,立项数]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String">
<![CDATA[HbR)gjhdS7VJ_2K0]AY&JiHgOB)f_=7,P-mT9oP51-Cj41aF$o]A@hSh~
]]></RowData>
</TableData>
<TableData name="Embedded7" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[分类,,.,,项目数,,.,,预计合同金额,,.,,实际合同金额]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String,java.lang.String,java.lang.String]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String,java.lang.String,java.lang.String">
<![CDATA[<KY*i_a"cfcSJ?1Zb&$*7uJ3tnZ;LBMGt2RTia`S[0R'j*`=X0#`(-th)''/2E`=4>*tl\S,
]A)uS_7iHT"j&j!E)3'7K-^XSb-Ke5_o]A51a]A!3*".l!cojSWb=nQiLqrQBJ1V7IX`/;8J/j.
$#W*D]A57X4M+_3F`gU)B7"_.^)T\,p>(@EYrZTC+h!s?t1BTB;gkB=JClUChH$HRuG).W8"Y
Q$cj3Me+D^e/)5FM036ahSKC.*8&QfVY9`<S0'F2@mUW8)nIpm^ojZ9Al&VJ.b&aoZ%_+@6T
jFWdT4)]AX-;?1tG[X'VRVQ0;5a<>MRut-;]AiQSnQJ&/%_mGE0Ym2f?uk~
]]></RowData>
</TableData>
<TableData name="业绩排名" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[部门名称,,.,,负责人,,.,,合同ID,,.,,合同名称,,.,,合同金额]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String,java.lang.String,java.lang.String,java.lang.String]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String,java.lang.String,java.lang.String,java.lang.String">
<![CDATA[Kp(=kg-?LoY;]A8)7j.]A\?M:B0i!ka"AJ!3*W?S)[<MsqP3rp4]A)M>IOPA`C*$bo,&-7,p`RG
!dF^>Cpt#i`'(7u)*::[?np*r7Q-&@YPW8[92LHj5Q1VJS+rRcP7r>Unj&+M^L8#bJ3ZY\cg
n^hBgqB)60JXaU/E6Pr7O<Q%`n;]A,NG^JWs1&kA_(f%45,Hf*C4S-d$&3#]A^!*jc-_2iGQ[r
2F2%`B#%bl0niD#1_OjeIT[ke,E;"CaSlilR8%)acSN1**P(cL'N%pOIkkd&%A_Y_GSdT@Aa
8LO&/<VE73i\kd6Q2cZk@rF<"IJ8c@?A6P,Vkl>pmQM?2QG-+RD616"j8V`skBSM&;+O`$-:
b(oI"@@Uas]AsuF55>AnZ)5*\fcE)V\f)t[D'"jf"W9MK0F58]A<IM"3^NcL<Q=4j/2hP7f!=g
JPW(ZDGtXKQ&3nl<,'eSsNE2j$6l(3Y3L@]ASdq!4>fa.M1>-9mO(94:'(T<aEG<pZ3)ob,$L
Q^8=`K2oN4fZ4QihCt($W'onZ^U.&s_17EtnR8@gtUF!gEKa>"f;";<f@b[Vrs-rGDq[XPo)
1VNC?=!`F8aui~
]]></RowData>
</TableData>
<TableData name="业绩同期同比" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[年份,,.,,季度,,.,,金额]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String,java.lang.String]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String,java.lang.String">
<![CDATA[1GUYki-`7Nc''.W:Y.4J\n`1]AM6Rqb&PR:J%oh'2`"XB+UD#+lA;h(J3dWd/">^^QW$SISVF
F+N#]Aku!Ojq7l2).%BM^$A&2DG:6~
]]></RowData>
</TableData>
<TableData name="工程售后" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[金额名称,,.,,合同金额]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String">
<![CDATA[!?hI"s5njDl%bDcU7DTJ0JEjq\$G1jY3<$ak*3=9Kr#)20JE~
]]></RowData>
</TableData>
<TableData name="2019回款" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[时间,,.,,实际回款金额,,.,,目标回款金额]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String,java.lang.String]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String,java.lang.String">
<![CDATA[1GUYkj>8\N0]A4bh&mWc7XEh+HiT]A(8:NnDN1c@,IKF.)3JI7hGQ("+-<Hc5Y=o_Ph"J<u2NM
P">^]A4?~
]]></RowData>
</TableData>
<TableData name="2018业绩" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[时间,,.,,业绩实际金额,,.,,业绩目标金额]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String,java.lang.String]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String,java.lang.String">
<![CDATA[1GUYki&!8E0]A4bh&mWc7XEh+HiT]A(8:NnDN1^8i+QpLq"ofr\3auGATTIN$3JegV:AmiHQZY
./YNPO6K~
]]></RowData>
</TableData>
<TableData name="2019业绩" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[时间,,.,,业绩实际金额,,.,,业绩目标金额]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String,java.lang.String]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String,java.lang.String">
<![CDATA[1GUYkj>8\N0]A4bh&mWc7XEh+HiT]A(8:NnDN1c@/J1bjUgmco?1)Hdtt_GtbG"\jOD:!LM+:M
8".$A&[D1GAe/~
]]></RowData>
</TableData>
<TableData name="2018回款" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[时间,,.,,回款实际金额,,.,,回款目标金额]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String,java.lang.String]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String,java.lang.String">
<![CDATA[1GUYki&!2C0]A4bl&mWc7XEh+HiT]A(8:NnDN1c@;N1bj^jmco?1RK/VA)H]A=*G!Z@,N=@kl9Y
i3NcCPI[1]Asa72_Y43~
]]></RowData>
</TableData>
<TableData name="ds9" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[FRDemo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT * FROM 地图]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="ds10" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[FRDemo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT pid,销售额,${int(RAND()*100000)}+销售额 as 新销售额 FROM 地图 where pid is not null and pid not in('天津市')
order by random()
limit 5]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="多层饼图" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[年度,,.,,季度,,.,,类型,,.,,金额]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String,java.lang.String,java.lang.Double]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String,java.lang.String,java.lang.Double">
<![CDATA[1GUYkjF"8.iT]A(8:NnDNHp2o5ZN]A_l)tn4hR@&"4Th7LS2t,kP<fj,6Yo-M]A<tC$\/<U:07`
Hc/@llDeR[P+e9-W&'C(?AR3dWc>:,>fNF@h-\;e#n0~
]]></RowData>
</TableData>
<TableData name="Embedded8" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[ColName1,,.,,ColName2]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String">
<![CDATA[1GUYkI(FCBdp:-VN=63q~
]]></RowData>
</TableData>
<TableData name="Embedded9" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[ColName1,,.,,ColName2]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String">
<![CDATA[Ha9F*l.X*PG:hi31,/b/~
]]></RowData>
</TableData>
<TableData name="Embedded10" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[ColName1,,.,,ColName2]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String">
<![CDATA[Ha9^8l.X*PG:hi31,An1~
]]></RowData>
</TableData>
<TableData name="Embedded11" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[ColName1,,.,,ColName2]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String">
<![CDATA[Ha9F<l.X*PG:hi31,T79~
]]></RowData>
</TableData>
<TableData name="Embedded12" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[ColName1,,.,,ColName2]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String">
<![CDATA[HTHNIe$Y++mTRVEA8VDJ~
]]></RowData>
</TableData>
<TableData name="Embedded13" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[ColName1,,.,,ColName2]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String">
<![CDATA[1GUYkI(FA,Vm1dR!!~
]]></RowData>
</TableData>
<TableData name="Embedded14" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[ColName1,,.,,ColName2]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String">
<![CDATA[Ha9F*l.X*PG:hi3[P.[]A~
]]></RowData>
</TableData>
<TableData name="Embedded15" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[ColName1,,.,,ColName2]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String">
<![CDATA[Ha9^8l.X*PG:hi30er_/~
]]></RowData>
</TableData>
<TableData name="Embedded16" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[ColName1,,.,,ColName2]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String">
<![CDATA[Ha9F<l.X*PG:hi30f&e0~
]]></RowData>
</TableData>
<TableData name="Embedded17" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[ColName1,,.,,ColName2]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String">
<![CDATA[HTHNIe$Y++mTRVEChWkL~
]]></RowData>
</TableData>
<TableData name="钻取地图" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="province"/>
<O>
<![CDATA[]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[FRDemo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT * FROM 地图1 where 1=1 ${if(len(province) = 0||province=='中国(省级)'," order by 销售额 desc","and pid='"+province+"'")} ]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="钻取地图2" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[FRDemo]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT * FROM 地图1]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="当年回款同比分析" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[当年计划回款额,,.,,年份,,.,,当年实际回款额]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String,java.lang.String]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String,java.lang.String">
<![CDATA[!>tn"s#)er0F?jSPNB?^jdVk(XM3qnSI%/63A:~
]]></RowData>
</TableData>
<TableData name="去年回款同比分析" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[年份,,.,,去年同期计划回款额]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String">
<![CDATA[Ha9F*l.X*PG:hi3ZSX?9!!~
]]></RowData>
</TableData>
<TableData name="柱型折线图" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[星期几,,.,,本周,,.,,上周,,.,,1,,.,,2]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String,java.lang.String,java.lang.String,java.lang.String]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String,java.lang.String,java.lang.String,java.lang.String">
<![CDATA[HT#C5ZT7WLltG<60f@lG2MPTQ"0Q8JM-W80%T(L\K$E6e4$#B]ANIZUG8L'm'$^el]Afs;j%JW
`J<#+T92US_uK=X*2dL$NDXb@qBj*/`]Au4C,6*CppSP"Ig8/!!~
]]></RowData>
</TableData>
<TableData name="级别分布" class="com.fr.data.impl.EmbeddedTableData">
<Parameters/>
<DSName>
<![CDATA[]]></DSName>
<ColumnNames>
<![CDATA[任职级别,,.,,记录数]]></ColumnNames>
<ColumnTypes>
<![CDATA[java.lang.String,java.lang.String]]></ColumnTypes>
<RowData ColumnTypes="java.lang.String,java.lang.String">
<![CDATA[$SpZt1>iKpj"pe"k+$$KdXopb86U&&!_H<c;c<Y~
]]></RowData>
</TableData>
</TableDataMap>
<FormMobileAttr>
<FormMobileAttr refresh="false" isUseHTML="false" isMobileOnly="false" isAdaptivePropertyAutoMatch="false" appearRefresh="false" promptWhenLeaveWithoutSubmit="false"/>
</FormMobileAttr>
<Parameters/>
<Layout class="com.fr.form.ui.container.WBorderLayout">
<WidgetName name="form"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Center class="com.fr.form.ui.container.WFitLayout">
<WidgetName name="body"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name=".SF NS Text" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WAbsoluteLayout">
<WidgetName name="absolute0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="report10_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report10_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="宋体" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="2">
<FRImage fm="png">
<IM>
<![CDATA[,ueSX'3>m^6OZ?oEJZp]AM+=oR.VRX7.1.OISc`(<BL*2,NZ3aBWY5q$%>uD3'c2b#acS%i2K
<GaOGsUW:u&(&KZO@2A-jO2,nUmg`r;A^n%JVdrU0E.n)eKp$+.-_YQOslTFL3G".6(8IjDo
OI:N.UjT(Zd$X3!8c7L"'krQcTG>`*pZ=Z&iI_XobE3^Qm1?V&:V/gecG7n\?kW_r"iV;]A]A6
[NDt/u^i^CA]A>3C$2eJN8pW3P\jd?C^K:<Ogn!:!!pI`M3:f<B93+SYB4rsM54#kCaq\Gg+8
u$d@4Mh"8(J6VYLjmiFV^Cc/9%MrN%$[V+H)%cQjM9*)g^U!058aSGkSL"Yl,[^sc)B@fWL=
ZbHW^6Vf"*afJ,$M;t^IYQ/!^P62Ejg7)u;0RO+e>e*)#48kGrmi[Zfg^!>^Fu@=m52*n.C^
8n3ChFB[/\$]A?/YK9&M+DL$/IeQKZ?ZFuL[^GtQ]A+l!']AQ-tk@FXO!kPKD^71$ZSXetMX-&-
L<.LM3Gm]A'pb->_PA$d9P0JOH-R!?l;3+!H@>N8JuTorX>oX2Xoe3eS:/.>ut,:DeaoLc!E2
OSJ[dV8AG;3UYbYG6>!=L>"R#9T\U[4)]A/O2KHZ*li9okXDi(#nAJEr\WQ0[1rCX#I3gHFcP
,L;Nin%qV2VYfp\MG'RQZ%@aB1dmR9XPjK0kNP3EDN%04lU_nHJ;[)`r5*L2J?*=,R2*t_:Q
W`Er?1t7n<\c_077>@25.GRaI>eEQ&08c(ooXqO=K/jZrSJ)r12Ot6Y)rT?Fmha2#HS'><k\
ZNU?skXLF?-FIq$Y&L%hLHKMS$J3$&A-<0G*ZjDhsTH0F)Ea!O/TFV^X88SJh7D;0OsR@m+f
0H!Bt@J`a\Aa9D8@EQsY=$MG8K8[iiKmK)%O6YurUMifTESS.l,n^F8]AKaKh<Drm,&=nY6V/
!;GWa]A;;UQ?O*F*"XL]A.=PD8!XodeHH/-`III46QM:A-Z(q*%i(/o3!*k=igTh)6KkYa2\dd
YHC%R$!;.^m'YcA[`UB@%Ue0b0sCdfCRU&=.Q9775V&>R6\Lho21Ea#nbr8&cNf(^P9?@aI:
IXCHiB_*L*FfNt=5(5g!XA\m;A(83Apme!fQuADt4Cr#bA7^[=#]Agah1B8-M[Z6pe]Aq7j<Wk
IWTpk\b-%GkM2/15RJAuY>7^q1FhUGC"`;XJc"NTf?NFJ`YRlMW,%FVZq@r>.Oo19L2k<hg)
a2"44;eXAQ2R0BO_+c\Bm+r]AC8SRe*LP/C6`UmjhB7.i9)i5N+B3<%,RS1A[!S@s[-Aft>Us
3.!%Piq<6G\oX?(C%#C\skor)(WJQ7P8I.;<>F4,h@\rS1f&o!,;8s9nD3#o)THH9*haHb4A
KXMTl#!eZ&Y8LTBbnh8DShd;BmXB<'Eo)(p-W_"Wh$?_UeJ_e'S^qQp`j@am^@8(CsNpc@-^
bG#<3N"3Qhb7BD=ge^P(BW<3m%4mjC;JF6]AhU=%P!Db=7IjKD56/RKoBGX=O2!((npW`stZH
lRBRmnl7Q>3bjnjXo(Jp#kq_0-R\XCuF0@Nbr6Q=u:ph5PN4mc)G;;f#,ul`2gtB4HjZE2@:
\e/Rs*"#$u,-LtS@ig#;"I9Cd#_k0_4BO[.Uok1Rh$_e49)8g3.:\&N::OmldKa$2KgTl1,I
0JR7H%M^%"AXbrFV4u3`-GEk&*mWe=0_rYg:L`c_m@&L#D^ol]AVWL_HhlK]AOmtWTL(D*BYVB
5*>>-eueYQ&+@(c#n*`#\6(j^\p@W[OGOYbjK#A/7tFXlJ'8\6RGA&%[s$Qj6J#nji7KA*n$
%LJ#X!]A8[K<kNcUIm2#I]AC8s3K13P.8[9QWNt.BmnnpPS0Q;og2qD!h4mq^."Uu7@Hm[NI4K
f(O`TohpcFpE@b[/ut]Ab/hd2Tn)>2cCjbRSJB"GK>,M<`JRhIB>!QPTZ"A>4\c\>FChd^gIX
UEVG#F/k`tW0Qh60D?&j)Q+Kt<4altqB()Fl_/m.Ec#Me9(R:<)j_WZa1i+>V5@f30g0"?(
~
]]></IM>
</FRImage>
</Background>
<Alpha alpha="1.0"/>
</Border>
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="2">
<FRImage fm="png">
<IM>
<![CDATA[,ueSX'3>m^6OZ?oEJZp]AM+=oR.VRX7.1.OISc`(<BL*2,NZ3aBWY5q$%>uD3'c2b#acS%i2K
<GaOGsUW:u&(&KZO@2A-jO2,nUmg`r;A^n%JVdrU0E.n)eKp$+.-_YQOslTFL3G".6(8IjDo
OI:N.UjT(Zd$X3!8c7L"'krQcTG>`*pZ=Z&iI_XobE3^Qm1?V&:V/gecG7n\?kW_r"iV;]A]A6
[NDt/u^i^CA]A>3C$2eJN8pW3P\jd?C^K:<Ogn!:!!pI`M3:f<B93+SYB4rsM54#kCaq\Gg+8
u$d@4Mh"8(J6VYLjmiFV^Cc/9%MrN%$[V+H)%cQjM9*)g^U!058aSGkSL"Yl,[^sc)B@fWL=
ZbHW^6Vf"*afJ,$M;t^IYQ/!^P62Ejg7)u;0RO+e>e*)#48kGrmi[Zfg^!>^Fu@=m52*n.C^
8n3ChFB[/\$]A?/YK9&M+DL$/IeQKZ?ZFuL[^GtQ]A+l!']AQ-tk@FXO!kPKD^71$ZSXetMX-&-
L<.LM3Gm]A'pb->_PA$d9P0JOH-R!?l;3+!H@>N8JuTorX>oX2Xoe3eS:/.>ut,:DeaoLc!E2
OSJ[dV8AG;3UYbYG6>!=L>"R#9T\U[4)]A/O2KHZ*li9okXDi(#nAJEr\WQ0[1rCX#I3gHFcP
,L;Nin%qV2VYfp\MG'RQZ%@aB1dmR9XPjK0kNP3EDN%04lU_nHJ;[)`r5*L2J?*=,R2*t_:Q
W`Er?1t7n<\c_077>@25.GRaI>eEQ&08c(ooXqO=K/jZrSJ)r12Ot6Y)rT?Fmha2#HS'><k\
ZNU?skXLF?-FIq$Y&L%hLHKMS$J3$&A-<0G*ZjDhsTH0F)Ea!O/TFV^X88SJh7D;0OsR@m+f
0H!Bt@J`a\Aa9D8@EQsY=$MG8K8[iiKmK)%O6YurUMifTESS.l,n^F8]AKaKh<Drm,&=nY6V/
!;GWa]A;;UQ?O*F*"XL]A.=PD8!XodeHH/-`III46QM:A-Z(q*%i(/o3!*k=igTh)6KkYa2\dd
YHC%R$!;.^m'YcA[`UB@%Ue0b0sCdfCRU&=.Q9775V&>R6\Lho21Ea#nbr8&cNf(^P9?@aI:
IXCHiB_*L*FfNt=5(5g!XA\m;A(83Apme!fQuADt4Cr#bA7^[=#]Agah1B8-M[Z6pe]Aq7j<Wk
IWTpk\b-%GkM2/15RJAuY>7^q1FhUGC"`;XJc"NTf?NFJ`YRlMW,%FVZq@r>.Oo19L2k<hg)
a2"44;eXAQ2R0BO_+c\Bm+r]AC8SRe*LP/C6`UmjhB7.i9)i5N+B3<%,RS1A[!S@s[-Aft>Us
3.!%Piq<6G\oX?(C%#C\skor)(WJQ7P8I.;<>F4,h@\rS1f&o!,;8s9nD3#o)THH9*haHb4A
KXMTl#!eZ&Y8LTBbnh8DShd;BmXB<'Eo)(p-W_"Wh$?_UeJ_e'S^qQp`j@am^@8(CsNpc@-^
bG#<3N"3Qhb7BD=ge^P(BW<3m%4mjC;JF6]AhU=%P!Db=7IjKD56/RKoBGX=O2!((npW`stZH
lRBRmnl7Q>3bjnjXo(Jp#kq_0-R\XCuF0@Nbr6Q=u:ph5PN4mc)G;;f#,ul`2gtB4HjZE2@:
\e/Rs*"#$u,-LtS@ig#;"I9Cd#_k0_4BO[.Uok1Rh$_e49)8g3.:\&N::OmldKa$2KgTl1,I
0JR7H%M^%"AXbrFV4u3`-GEk&*mWe=0_rYg:L`c_m@&L#D^ol]AVWL_HhlK]AOmtWTL(D*BYVB
5*>>-eueYQ&+@(c#n*`#\6(j^\p@W[OGOYbjK#A/7tFXlJ'8\6RGA&%[s$Qj6J#nji7KA*n$
%LJ#X!]A8[K<kNcUIm2#I]AC8s3K13P.8[9QWNt.BmnnpPS0Q;og2qD!h4mq^."Uu7@Hm[NI4K
f(O`TohpcFpE@b[/ut]Ab/hd2Tn)>2cCjbRSJB"GK>,M<`JRhIB>!QPTZ"A>4\c\>FChd^gIX
UEVG#F/k`tW0Qh60D?&j)Q+Kt<4altqB()Fl_/m.Ec#Me9(R:<)j_WZa1i+>V5@f30g0"?(
~
]]></IM>
</FRImage>
</Background>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[723900,723900,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0">
<PrivilegeControl/>
<Expand/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList/>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m95!9;ca`Hl`AoZ9:9)?WUb*lD68i#(/P)J'".,2<"W?Dd\7SZ#c=&g$!SO*,ZVH;DS^FQMX
m"0[?.Y,kr)'FJ]A(S.'H.$B7E>S20aU06KFgJ!mgIXEP*6n'WrJIaRJYihpR^i&htbQCDstg
`$%YkT57nG<&=E7e2r>&MQpM,cGV&J_;i,uB'e@[^JGCpVD_CiUmL_fV)Y-3JX1G-<<V`?,g
kF]A[=1kn"lV?I&70-2#?6&aDUihq=^Q-0ceifGu8]APDob3uN_60Tl^<f8MVV9gW3oum3#dVR
YmEY;EEX:j;h%FT(a3@3b8[]ARM//dp"-Uh/Q78aPlW"*^q!5ekq>'&A#(ItrfCG]An4rMa_WS
YUH<9cF1:dVq!<?)D,Y!;XC`RKeirE\*Gqg^_."[C"$no/c+bhR74q`4W9;dl5>j0"+n?[U]A
BMIFh'l_%lN\!mNKbIrHFm@V<Dapi@Fa6W@);!>SiWiZ7En*S6)1Xgg)#]A%fB7G;;PK`=oUj
;ZJ?hM9DUC]AD9bg,1(s38_'o'8lcs]A3ehTr-4t8hJj`R9j9hR3EP14P/:U6B>.j8,[[L@8*8
q(ZHm&TO`De#CcVFd-KA4<)-fhYY2/#C]AdElAi4AmX(jiN8^Iqc1S)g0SM<Ak+hF9D_daZ`P
6K@V>,>NH^RVG&NPX@^,CV=Cuci>bPEZ*IY6mbb$n:o,Uhf8Q(frWE[8`?$#4pm9e,7c880(
?/,98`^:UjUSC+`VT<T8S3-&lV@)<Dg"KBU@@GG^+*p*Ah)V#!rT*.]A`ohqU_EF*&\UlYtS1
EOK%K&c`aG0"<Ji([0/"9Hlg<;iue:1[d-+Bbrr4(f[k"U9YI^7&6g,YWIjl+C"dg%eYG&@-
8EF\in8/!u&fVHIN%l9r8oC"6CB4r!Y$2r]A*`/h.XrKqpn74`LAND6\S,?[a(0[Wa1_hEu$o
,&.e[f/uo^AkpI*n.b5P+tVHJa$'ff)\$@J1eY,0r.[&B/Dl?593'?VD?Wjd!BYQ#)Oi,ri.
r$+%)tWWYomE=k\g;RLI0Y3VPYV1D5]A6N^Bo11J))"X8-$R?Sj/ZMgp/eUY'#\2`e-,[,H37
$petP`b%jNIK!BGf=F9m&_nB=8K@-V>KD4k%FS^Jc;"^L=dp&2GAiN78VnbJ"*:ObcOq8#41
-^?`L39>EufZ29,]Ad"m_#PAA8(,i(M\&[q2Y8W&UM]A;JY!<&^]A0pgW28NYeO.%InmZF5]AEC$
[O7k1\>s-_G4Ee[+;[go?8cL,@rFLPH((s,ps"o&pHqWU+A(Qik4m8:NgPp+0QX9!!YRu,"`
#3C9\H'mO/'`RsCSNAq%+;<5hYWBbepHf."6ZA_4%mFGn>F8hm9O6AcQCCM+`H6kV?Y"P^m/
!e`N7/N_A/&(<<85Q5uLcGc^kF"8"MM[1K>G6?!_SWe96Uj4oj3*H-;qEI4)\:'t+[qs.I%I
^qFai@Gi1g#DG+rO7>J_+$JDr8Euo7mV0>d,_2:en[5t:)-O-CW-ur.8^eX!)jg7^L5FAASH
RB(Xju+BqR6uacn]Adk8u"[,g;=H#`'Y3NQY]Ah@pGfBO68HS3*tsJP3,MYDBq$gYbO!a8(sSJ
R3C>@"mRQ3XSrJ!^,Yq'-]AqUrJlhF+L!qr]Asbb*MN$MKudrd1/%ltF&u6g3;e*g>l31#kFbf
u"TBrmnOY:p[NL$\%.G5B=+o"Xm[$m<Ak(mf0O<N0HR;jfJ0IYV:`V0KTaklS$6=ej^Rnb8\
r`)'G4&^c?"L6\*61A3C2d-3A96__gH>BBdj]Aqi6UBB-rprX95W,+Nm&6SUdA7ZTY0S%?"7h
'S8;=SIkB$bp1oE%*WnR@1+U*:Y3^DOmo+V%j#t!-=0osb:dEAmof:`mqgGp5bA.]Ar0kqcD4
"SB%J,h!p5]AmH+ncI6C-KX0s*5Gj$2bKCj(2n"[EQ`r!3+h9f)rh3a&?75,e8L-M#;O)C'c+
8'G/c4;`kIA"j+pE)8=muhInce7CCTE\[HSC@l@F(#jN/&rue\:?2tYsnOacrIh*r:g$Yl?2
7qrIS`JW+Z9X[\Lsg(/PrRM.USH9$U=LQCLY1@+K2BfdXR(K@_+/3j*R'O>n#LN<J:r="ACD
)`e9#jOPGN.SYTQ#7)GUo>rM`</Nrs6pPdqA:>mAmcg]A8i.hBaR8Z);uV<Z6R]AM7Er$<m5Aj
#b8&PQeH=[@WKmG<^sER=lSW*#Uf"7Whe4m$cafdO04n6@FcfVEdOB-@GPsUU!.BcHQ$M@PI
!#QY9T(H4.q=Y#L(Xi1i-^[EUVY`09n^h`5$(cpS"0;442'!mA'#1ZH-@qKP6`fNW^kiM.GR
%9np7*4icoA8-Fg0\J!?e*Y*l+f&AfoY*UbBE5u7CGDiT+9MG]Apn1jf=&8@IBP5#[Vi'OC1Y
m\\_f"En)-1=`0c*a%bnTLi@N/pJj_W%VO=L[5&nc9HmQ`cLb6<Ab2g+?nG_An;?FO]AIC[U_
@1Y3sFElG;iSpSs<V2*$pEm6"_*Ol#F)S^=**q!`K-)nVdb-CQ'JYFr#u@^<lH*>-q[nHN%]A
<*eqPcq97[[UamP0`i_.k-Wi73POj@]A[9'Fgo]Ac@+WEOo@T)70T_"_VdCjok_[Oq@dQ6P'f8
ec;\K]AJZ@Df+Si*4`$GCu2V'nIjRcGT21f.&25!O)fACOk;I.#Q1LJWn%#r_=3("V:9M[i]AY
d:Lm/4>hfN?YnuN^E<BJ@m?[GGRcdG+!8gmV?8YuoZjje!%(Tif?^2-42L*qWlP4/]A^&Ds\9
0CA8VPBZ('$/Ch[S8-oRq.)P+tRLeeP[ZefKc(8!'pZZo'FbsOn9f>Cd]A0u?))`gGhb4d@;n
&>>J>r]Aokbbm&FojoHdRH*ll'hZBM^7BXtcqNi&eqKXTB)n]AJJodAfh*3,:+/#^&8%.V.H[t
"A$fW)Vm7Z"'Z/d4D!KaAW->VT&UuV?uE#;UTFChYf-nfW*='`SE!B<,pMK3]AWP.^he0=On?
g@f/3=9p.K[%g-Ue`upruHk9X!d[Ujj'&%SM36LI1dB*TuE&$(\5:Y_XHIHE,He'/VVa;dVj
X]Ac$\i\2TN]ACW.j5HT9;-2^mk@n)8rB3M=%!(SQCXlU6aI@;n=N7WAZf'#5b=O=O'Z=ga6e"
)7@&r045lD?Y0)AS#^=kG'RO;#TT_XqiKNkcI.s]AH;t=61=KKV'p[0#ok2fG&'i+#IFMmS?4
)4G[%SL[=diN7E]AY5OVPVHEOL^t8rdjHq+`)#LqsD*0/*fNo?^^\ek:'nPb?a^E0$Qj'30(V
T7\H`%B3[c`iB?f<!(a1Pg-U0BL.\a1Pc<kk7b?_gM46(4p<pL.c8?OO:_sL:H2PlCgBIm=:
NhHl358o.7D;J$h3t^_7&C/3O"EfSe(ms!?P0RFIe`KiDNVWL]A_k)ro'7hGhRcgS\_9[rDXG
cO&e"3-?:D7Y,pb"J>m\nJml16&CT*op.OZV\<RV!&kuAneV0q85Y`V,J00?h/VI'I4!QC2$
Nj!i!n0>n9MoGR$X4.C'quQk44I0N="<K'+lHHX+760b9B5uMos`G.e/<'B^/#Et118]A-*f#
*<T)@;&F:g8_*[r`7nL4tl`=gUR!YikkKG$comC.M3VDt'gk:6YhJ!Br@d67<UH->+Zf/:1_
IFq?jAA3i0VaT9FJM03FG6AJl`4&d[q9@@\49#N~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="250" height="150"/>
</Widget>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report17"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="宋体" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="2">
<FRImage fm="png">
<IM>
<![CDATA[,ueSX'3>m^6OZ?oEJZp]AM+=oR.VRX7.1.OISc`(<BL*2,NZ3aBWY5q$%>uD3'c2b#acS%i2K
<GaOGsUW:u&(&KZO@2A-jO2,nUmg`r;A^n%JVdrU0E.n)eKp$+.-_YQOslTFL3G".6(8IjDo
OI:N.UjT(Zd$X3!8c7L"'krQcTG>`*pZ=Z&iI_XobE3^Qm1?V&:V/gecG7n\?kW_r"iV;]A]A6
[NDt/u^i^CA]A>3C$2eJN8pW3P\jd?C^K:<Ogn!:!!pI`M3:f<B93+SYB4rsM54#kCaq\Gg+8
u$d@4Mh"8(J6VYLjmiFV^Cc/9%MrN%$[V+H)%cQjM9*)g^U!058aSGkSL"Yl,[^sc)B@fWL=
ZbHW^6Vf"*afJ,$M;t^IYQ/!^P62Ejg7)u;0RO+e>e*)#48kGrmi[Zfg^!>^Fu@=m52*n.C^
8n3ChFB[/\$]A?/YK9&M+DL$/IeQKZ?ZFuL[^GtQ]A+l!']AQ-tk@FXO!kPKD^71$ZSXetMX-&-
L<.LM3Gm]A'pb->_PA$d9P0JOH-R!?l;3+!H@>N8JuTorX>oX2Xoe3eS:/.>ut,:DeaoLc!E2
OSJ[dV8AG;3UYbYG6>!=L>"R#9T\U[4)]A/O2KHZ*li9okXDi(#nAJEr\WQ0[1rCX#I3gHFcP
,L;Nin%qV2VYfp\MG'RQZ%@aB1dmR9XPjK0kNP3EDN%04lU_nHJ;[)`r5*L2J?*=,R2*t_:Q
W`Er?1t7n<\c_077>@25.GRaI>eEQ&08c(ooXqO=K/jZrSJ)r12Ot6Y)rT?Fmha2#HS'><k\
ZNU?skXLF?-FIq$Y&L%hLHKMS$J3$&A-<0G*ZjDhsTH0F)Ea!O/TFV^X88SJh7D;0OsR@m+f
0H!Bt@J`a\Aa9D8@EQsY=$MG8K8[iiKmK)%O6YurUMifTESS.l,n^F8]AKaKh<Drm,&=nY6V/
!;GWa]A;;UQ?O*F*"XL]A.=PD8!XodeHH/-`III46QM:A-Z(q*%i(/o3!*k=igTh)6KkYa2\dd
YHC%R$!;.^m'YcA[`UB@%Ue0b0sCdfCRU&=.Q9775V&>R6\Lho21Ea#nbr8&cNf(^P9?@aI:
IXCHiB_*L*FfNt=5(5g!XA\m;A(83Apme!fQuADt4Cr#bA7^[=#]Agah1B8-M[Z6pe]Aq7j<Wk
IWTpk\b-%GkM2/15RJAuY>7^q1FhUGC"`;XJc"NTf?NFJ`YRlMW,%FVZq@r>.Oo19L2k<hg)
a2"44;eXAQ2R0BO_+c\Bm+r]AC8SRe*LP/C6`UmjhB7.i9)i5N+B3<%,RS1A[!S@s[-Aft>Us
3.!%Piq<6G\oX?(C%#C\skor)(WJQ7P8I.;<>F4,h@\rS1f&o!,;8s9nD3#o)THH9*haHb4A
KXMTl#!eZ&Y8LTBbnh8DShd;BmXB<'Eo)(p-W_"Wh$?_UeJ_e'S^qQp`j@am^@8(CsNpc@-^
bG#<3N"3Qhb7BD=ge^P(BW<3m%4mjC;JF6]AhU=%P!Db=7IjKD56/RKoBGX=O2!((npW`stZH
lRBRmnl7Q>3bjnjXo(Jp#kq_0-R\XCuF0@Nbr6Q=u:ph5PN4mc)G;;f#,ul`2gtB4HjZE2@:
\e/Rs*"#$u,-LtS@ig#;"I9Cd#_k0_4BO[.Uok1Rh$_e49)8g3.:\&N::OmldKa$2KgTl1,I
0JR7H%M^%"AXbrFV4u3`-GEk&*mWe=0_rYg:L`c_m@&L#D^ol]AVWL_HhlK]AOmtWTL(D*BYVB
5*>>-eueYQ&+@(c#n*`#\6(j^\p@W[OGOYbjK#A/7tFXlJ'8\6RGA&%[s$Qj6J#nji7KA*n$
%LJ#X!]A8[K<kNcUIm2#I]AC8s3K13P.8[9QWNt.BmnnpPS0Q;og2qD!h4mq^."Uu7@Hm[NI4K
f(O`TohpcFpE@b[/ut]Ab/hd2Tn)>2cCjbRSJB"GK>,M<`JRhIB>!QPTZ"A>4\c\>FChd^gIX
UEVG#F/k`tW0Qh60D?&j)Q+Kt<4altqB()Fl_/m.Ec#Me9(R:<)j_WZa1i+>V5@f30g0"?(
~
]]></IM>
</FRImage>
</Background>
<Alpha alpha="1.0"/>
</Border>
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="2">
<FRImage fm="png">
<IM>
<![CDATA[,ueSX'3>m^6OZ?oEJZp]AM+=oR.VRX7.1.OISc`(<BL*2,NZ3aBWY5q$%>uD3'c2b#acS%i2K
<GaOGsUW:u&(&KZO@2A-jO2,nUmg`r;A^n%JVdrU0E.n)eKp$+.-_YQOslTFL3G".6(8IjDo
OI:N.UjT(Zd$X3!8c7L"'krQcTG>`*pZ=Z&iI_XobE3^Qm1?V&:V/gecG7n\?kW_r"iV;]A]A6
[NDt/u^i^CA]A>3C$2eJN8pW3P\jd?C^K:<Ogn!:!!pI`M3:f<B93+SYB4rsM54#kCaq\Gg+8
u$d@4Mh"8(J6VYLjmiFV^Cc/9%MrN%$[V+H)%cQjM9*)g^U!058aSGkSL"Yl,[^sc)B@fWL=
ZbHW^6Vf"*afJ,$M;t^IYQ/!^P62Ejg7)u;0RO+e>e*)#48kGrmi[Zfg^!>^Fu@=m52*n.C^
8n3ChFB[/\$]A?/YK9&M+DL$/IeQKZ?ZFuL[^GtQ]A+l!']AQ-tk@FXO!kPKD^71$ZSXetMX-&-
L<.LM3Gm]A'pb->_PA$d9P0JOH-R!?l;3+!H@>N8JuTorX>oX2Xoe3eS:/.>ut,:DeaoLc!E2
OSJ[dV8AG;3UYbYG6>!=L>"R#9T\U[4)]A/O2KHZ*li9okXDi(#nAJEr\WQ0[1rCX#I3gHFcP
,L;Nin%qV2VYfp\MG'RQZ%@aB1dmR9XPjK0kNP3EDN%04lU_nHJ;[)`r5*L2J?*=,R2*t_:Q
W`Er?1t7n<\c_077>@25.GRaI>eEQ&08c(ooXqO=K/jZrSJ)r12Ot6Y)rT?Fmha2#HS'><k\
ZNU?skXLF?-FIq$Y&L%hLHKMS$J3$&A-<0G*ZjDhsTH0F)Ea!O/TFV^X88SJh7D;0OsR@m+f
0H!Bt@J`a\Aa9D8@EQsY=$MG8K8[iiKmK)%O6YurUMifTESS.l,n^F8]AKaKh<Drm,&=nY6V/
!;GWa]A;;UQ?O*F*"XL]A.=PD8!XodeHH/-`III46QM:A-Z(q*%i(/o3!*k=igTh)6KkYa2\dd
YHC%R$!;.^m'YcA[`UB@%Ue0b0sCdfCRU&=.Q9775V&>R6\Lho21Ea#nbr8&cNf(^P9?@aI:
IXCHiB_*L*FfNt=5(5g!XA\m;A(83Apme!fQuADt4Cr#bA7^[=#]Agah1B8-M[Z6pe]Aq7j<Wk
IWTpk\b-%GkM2/15RJAuY>7^q1FhUGC"`;XJc"NTf?NFJ`YRlMW,%FVZq@r>.Oo19L2k<hg)
a2"44;eXAQ2R0BO_+c\Bm+r]AC8SRe*LP/C6`UmjhB7.i9)i5N+B3<%,RS1A[!S@s[-Aft>Us
3.!%Piq<6G\oX?(C%#C\skor)(WJQ7P8I.;<>F4,h@\rS1f&o!,;8s9nD3#o)THH9*haHb4A
KXMTl#!eZ&Y8LTBbnh8DShd;BmXB<'Eo)(p-W_"Wh$?_UeJ_e'S^qQp`j@am^@8(CsNpc@-^
bG#<3N"3Qhb7BD=ge^P(BW<3m%4mjC;JF6]AhU=%P!Db=7IjKD56/RKoBGX=O2!((npW`stZH
lRBRmnl7Q>3bjnjXo(Jp#kq_0-R\XCuF0@Nbr6Q=u:ph5PN4mc)G;;f#,ul`2gtB4HjZE2@:
\e/Rs*"#$u,-LtS@ig#;"I9Cd#_k0_4BO[.Uok1Rh$_e49)8g3.:\&N::OmldKa$2KgTl1,I
0JR7H%M^%"AXbrFV4u3`-GEk&*mWe=0_rYg:L`c_m@&L#D^ol]AVWL_HhlK]AOmtWTL(D*BYVB
5*>>-eueYQ&+@(c#n*`#\6(j^\p@W[OGOYbjK#A/7tFXlJ'8\6RGA&%[s$Qj6J#nji7KA*n$
%LJ#X!]A8[K<kNcUIm2#I]AC8s3K13P.8[9QWNt.BmnnpPS0Q;og2qD!h4mq^."Uu7@Hm[NI4K
f(O`TohpcFpE@b[/ut]Ab/hd2Tn)>2cCjbRSJB"GK>,M<`JRhIB>!QPTZ"A>4\c\>FChd^gIX
UEVG#F/k`tW0Qh60D?&j)Q+Kt<4altqB()Fl_/m.Ec#Me9(R:<)j_WZa1i+>V5@f30g0"?(
~
]]></IM>
</FRImage>
</Background>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[723900,723900,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList/>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList/>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="294" y="0" width="279" height="46"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="report1_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report1_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="宋体" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="2">
<FRImage fm="png">
<IM>
<![CDATA[m<IeQ*74C;Om"ZY&knAuU:2OZe<$WH.+)h[M)&8AM'+'I7'ro?LT&US&V?sVNR!4)b96YK0l
QKns2=fnpYkI]Af!EZUHgQ7,HM6%<HQrW03bhE)&eYhgB0)L$,UB2Ps7VG:jSs%<kT<D0P'b?
t1tBCX3W$?d7c9]AC"+A46b_^aC:FT8Ng<M-[3K$."4mtCh"IA.V)ANEJ;cCsol,as(#iGOYn
:R3RS%BT25rl%PrJY>YSAMJ;]APOXS<uiGA4/O#5kH?pu7e`CMQTMKCY_d8C$O,a_*HUiqc]A$
u,FaKdEo.N]A_;Gfi[qMaf.:F>UphK'd*5J2t%3dLts3tA>djF//`BY=Y;rK\c\&XWr,GI9DL
[,3*05UlChKmu!J4;6jr]A21H0^".mQ(*#JH$c(;oK09mS98k+QM&)/\Us]A%D4'oRp:I7:Zot
[Wp/T[#9_e_(%e>T]AelQf-Y"27QLj5N8[j-,Y6i6LA/Y#Y>DGb!fpZfXo(N\lcoRP+&rgF)d
>h44->n%8Km/1uS[_Wb5i`KK4f,k_jr*RB'MEVQADL]A"eEjasdk.luk,#laHAn[KWM?]A%j.[
//M&@"GnEOa85C)?P-Xj7OrcO?`1Af?%Ys.4gp8l?3up83b$BA?+B?a+%"&d!Qafm_5l,f;7
/EE$-)jj;AB?a/"(V0.>>>Y6:h3*4Yg[#hO&qcAcX^o#&,dg^E7CI$?IW`iQ<0de='T?0CSS
/nHc>mr$:k@_PDp2d9J1i"(*0f:>uj,#kG'YP=\[OuK8&^U(s?l.B+]Ai4'+kO[l(1:J)]A\28
Fa;_"Z7*N#9S:hr\j7;774*Q&f.lV:jJh2rZCf<L7o/.p'^@XGU)]A_QqD4+65H*0,R$Y-ao6
.b]Al5meHNp#@Qh\E$mKV0^6.9^6r4625@lXi/T!3;eLL2Q\K(d/JA18Himnpla'4$PMYnK@e
CqA/;_1[#NY5-:B$aD_8uN3U8s[R:MeYnQc)QbnG@/$joY&@Ko!MIjRo5>iXq>.`%j-#'J+l
`=^+*PD>p\Z[O&PO)83,3Was/WZ'^38P\tElu!=L:4m)8/=GGU@LQ<AEXTj9F,A>Q9WfbfY3
d6j2kJ8\GPlN:>hhCADnhD>P+9:-OV\0'RXOU;'=5rqsnB=0SQ`O4IK`RQ"H$#bgYU$Lc*7&
7UOGu/_<'Fa*d)priJai)BW-I<7&gt3^DTaaXV%Acq$eX[k%f=dEu0G.QlI[S>el]AbH/l]Ad7
FoQJ(t_VuH+=Na#)]Ap5:6Y_t-;WGgT3@77JX/u_PJ0:T+I%e=CmhY*K2kj%mCk@Z-N9rI?iU
i)`dQe'k/!ot:J*toG9?KNbc*WWLG]A:urq-Bc"E^F+<=89m$tPc!'&lO2Gb$Dr;/0B'1e/bo
f2aJ;j^^eA8+KR-F&<fqX'!pX,#=5SUu0hT.aUuE0AKf./O9_H]A,!l,bp+[OTQ>NLdY]A(UtB
hjK/WB?*2O9oTq/4R?OH?ofL^$f8E;-h:Gp,@(?^K+AW]AJ&T<oGt?*&p"923V/$RU+;;qD-e
R'-7l62d+k1Jb^./=_+SMfL*:Qgb?gqi?/ha7\rn84g`rc#[+N+cXD^=m%D1%++@Jp!Yh$4k
-+2Zio<!V=X3AP08[TeQTN#`8a37&mK95X2^n&1GX[7r2l("1[p5N\NI6kZN&OOs?O`EkJoq
=]Ao,[J]AltS(a9Wa;W_84%_GU%_0l7=Gg(d?/`#Iq!5tu5P@cHG9>MLRE?&u(B?44\MYFuf4V
r.@@f%A^b6b`S5o5TU&(_'"'PXep6!PG3^*FIq9l#oq$(<6a&(cX`t0Hjh#1]AOcMMkI0k!K'
]A08A"m?e?@M!mGG>+!I4%Ot8`6h?<jLX43&0q(Mo\Nk!sZ[fqO:+90K>"4&]A>?@:t3]AX1MlC
C>gn&MpTU9c6<]A-T+^_g#,\G4C[ERb`ZbN+SH%QslBV,/kb\I,H?Ig,n-5HR3-$jbi@H9EVT
FPMH2H58of>!8^:Z*D5CA^DR?g:'LmV*ocilO/"XJOE^:Q%`jmR0pfYJnXJl9fe6ErXf]Ai?.
MVS;[F;<eO`a;),?$l2]A=,C,[UtWclW6$8=pb"/!F(#Qn_qI?=7QY]AGTWkfPXZa$r=.PYQr,
2Hf&,(F,N'u557YK('!-=0!QR#!LU[;F;$*<=8`3p:7C'&b4WO?MPHrY1%&4LT&:aQTqQMRO
FCp88)%iGJ$RR>M.1X<lKPl4//r72VF$KsDbP\==(aRuE-1.H%M=_j?D"L1\nA:\S,@Zhh7X
JcscE)/lMU9Bgr#?mk7SZO/:3<&2>Y939=jODk4uUZm8B>6W=3,8+1FKr1A5YM+;]A_9C2^!Q
J`/!6rZ[1&<h(l#7AY<%jSIFLr8^j/ulXDmmD^p(sH_'G^*s)ZNH*RCW7Mi.nbN)p,FYVZ&b
@LZ9,<;U['oUfSJ#gK[1gHSD3G23!T(cH@OhBr=AB.;\Kp#llU6sSLRW$MT/CO#&?gWlV#FC
GL5WD.nX*oLKf@G+7q8J"#m'[P?YKu1&gK3pGYIfhjL/XbgHY:Ng/2\1pp5qNY'slqi4ZU$;
44(`56pcGJi=N[c^FQh("EuOb(Mk%J]At(ZqhYhdqU<AsGcFc<3ZO6;Fn+.g5_(bYK8rDY$_(
88?,BQANT_%pBGQ:fZ8iQWIJdj$D:Po`@-"ZqqNDTP#+?j"ns3UOHKj0^i:i%1$D\ofD'A;a
r0>q^mmn796+/)]As]A&L+a[ddtc1FS'Bj@pKq?\q:B[/FpKFRd<r?4rD`SqeXIO)NI0OF//o,
pR]AqGX=Tao&qfC/loqM.$fN3394D>TCP8"EA,e[J^,?FpE#WlPiV>0lWoeV4J7ao;1aIS<q/
EJ+o-W$OT*jiC)71J!W2o5rs/T("XhePlm!aM.bfN<?Z4^nT_0;X?o+jLl+kD2S=#m1r&Q7%
nl"K=Z?L-p!sU)>es'kf=V1C@4)2PkjLV;0n#7_?>NY&#hce-qN+5cg#=.rs+KQZpF#cN?"u
O4e,msr^Xhb]A%3/NIgD0]A_o\CL%Q15lkD(Zs+`.Or[4c(t[L=8+R;CuMW:HQSO;,0r2ACg0[
8rZM+b(D,ik_e%$FI^Q`-rT'?1H#,giY8WG%R_(YlS;14Z&>5h;Jc\/)lpct_UB7NLP=)4lU
lethLR!(,GG,r)b-JTRkhP6h;r;#[A+"aXmCVM-+s>G^Aq9Z^^ntj2dZ3ptg8K3;*K&3UmAn
'1\9^Bj\,76*>Y%:3gq`%c"ad(+,hu4G#=F2'KV6TU+euK:TslINKNuD64TFRAVET5V>D:1W
5n-Jn8dMd;0&KX(#K_L6Gp!O[Cp*lnYAp<,LY\LhGOKZiJI7sPDalJ%\/b#G^]A+#j!MRe_Ml
5Y-^bGod*\`0?4pcCu^:+P7j#OO?`.e[O+_*]A!OX=YJa)WX;*j\K]A&$_c?8lCt7AVYS(rtPm
Q"H_1f?Yrt_>cU/_LL$sZ#BZV=$+lmQ1Y5Db?k.G!#e[M^`t-eg_7@aK8oKupb,d?5qs!p)n
_o8rY7UbrI$DmHl7]A8Gbrn65\dU6jWB?Z\D`_t5=npr)`=B1e3M.$$]A.9J'[__$K-n"/cUXd
>sG@&TI+c#EF_%aeI6SV(9Ro?)-*TOnR@Yr((537D/GBAa>_cP2n2F/)VIfZD4)fg#=7hl*s
?Ag>N7MB$-7+,ogXa2-#7!kab!`(U+3CG.o(7Y@\o>,l;J*nUWp9/]A6/g8:&&&G_g%B^S]A+N
uSo"PH6ro-JLnb;d5*e1,:`WM^[HU\6S:D+Db>pa_,Jqu0?gWHJ":'X4-8mL^J5o))ko)M.\
Lb!9K4(?hnhF7g0QV<2@GQT$E,]A9bQA>f9f$!)AbBs)b8H&"N0k8XW&%%!0]AJ?rJ0NaXhMj$
:?BgB+A0Y.;0/C=p=*4/mZ\0HWO>^H,S6o$5QFRQ\!QA5:e(]A=V)gJ1SQtL_7o:B6:)9XFp8
/Zl(9uV8R.TBi?Kfm<ALms#tJ7IfQ//#&_c&"<,UH\b.C-1gZ[A)jKOSVU_?u!8AFCuTBTh'
/0T;ZV]ABW]AbE,!eM2PNK*^Hg8pB"mQSEng%/;QH[1lBqnW2E:pT5E?QcA&)=cLs/[W]A1aL<g
DQtA2WrAZY>SO8Q#WJ5d2Hl'8.O-K+uA@NQ<bV$:QL5(n`>b`9k1PWr[$TkI.Ii%%ZV-9)TQ
d5Z6j8dkc9De:KBCHS1pfpMIKpDE#m_FYM?2e(6ga"QmE/Pq@(pfNB;Zgnj:SV42V'q&qYJL
Ve')-LEZ.<4^3lm:=)lm@:=2;O/@U`bd'BJr9@,6,&Vo<oXCm8pMh\^1`#RfJ';p>#nhf`lk
\*-1Aru]A%q4#+j[Y8[7Bd*EBCW7j:j!VD;4E#liFn)6Hg#q(#u<C4H2-)Dr-:b$E\$U;FklW
Th$#F"W7#4,>rd`O^)HYellFFf!<4ID?Bd2DQWd\8pu+RXYO)TeTnLWK*pT;q$[;$'bNd9%R
P^4^kDWS?\7>6QQ'2n*EU>X?'!,ZhRaEPY4Ke=ooiErqG_[:BVK+qgq0d4)#GJj?0"%6=+V@
i8AgI#lRYhC1H2He=YSB+T8)6#Zt=$>IaK)/8'uIMQ3kMickJPh%LQ]A*l2[@5U6b0F`?OkRC
O_7H<lHP:c$"W1B`IV@7r!3qB\=2a\m)ZuSu^>(>ADifYk!M*VUaHd`a@6CE'p_['U)WLHu/
D8[2.huZt+fIk'`MsHQej]A>Ri*VZgnd,K^du0"To,*T*QtG#L&goF.Yj.LZW28qc]A#dG]A&`=
a?<9N1hcA6l=D-R'VWMWDJGP_BUKbY8c&,GShp-TqE'utB7R^GN4sL8o3kr999`)J6HCb2<,
sfocpjl/Btfp>$m!/N-HU-^T5;Z#EWtUN6B_Cr]A?8bN1+Gua&TRUr2"lGp+B]AI\[(XM&<LiO
6Hn/V-:T1=]A5=XrbcN6"hmFmnk8;+dmTq0.qkQn]A<r^CAi;9oCr(U:djA6En3-.^Z3KMAiqH
#iQ>-YtcW[Sbh9c(_G[r$f1M'k;NhX=?3KKZlYYI=7]Aa61M"J?b^5kJ,;Tu%>Ua<XUnULS2R
Hm@I6atJ(""-!hbSkh06Z*cF*fQ]A1T9A8J&!'o"'nsKD%O\c_"#5kl.n'A9,^b6^?%`l4IA^
39E&n^(\pT;4/_T>N17uZ"X8DGKLF4F=Is!Ma,,t[86MQ;X2R+a0XVj<I4]A2,$S1:("p@GgL
&tg"#g_8<.#E9h7^>AIR0/`:[GPK%Km6+k&.@]AnnT3nGk[+>D_2[Fa2h8a2V#\4;(*'*c[f1
bYmQfTJ<u)%eX()!4[/[M(Gdr98c&A>9,8H>WJ-Suo]A\gYBX2$%#lW2c,j[/F>E()*Pu(/BQ
.SCmBHZ0@<f3\DVb9f'g>i$W^Vg1V_osZ^,ROZ<gc>3[=(Keg#s,![GH4"c(Wtmfr?3&>pQ"
NTD4Xj/AuX0h2VO[4PZh6KLQn6o"cLdnA`A2'IV@V\9F\7%oB@eJrRV'Z=!`2G*:Q+/Gb1/H
eC)"<+.a*WdSY36-BV^AS#2mna>LQ?J^b.MA%F7LKhj`/W=EB00H=Hlhq&"p_jjpbjfQ4`qu
!76i_6SE4JDEE0hQ,jaXHt+cSdSK]A8>Go3j2>qgT'8Ff^(BQq#2Bpo0'Up'$6;\MM?;Q+3B'
\."Ff!qBK=598m0fC:73r"a98J@mW=L$FcmZNa\>_]A`'_[*cUH#9KVmM2T*<$qieHM@rq;$:
GQV?Pu.__r@?jnk2FRr\F%$lpfjUO0tI<unX8&K2(5TK-)[TRfrpjlFS!^Gbb1#iC;=:^h9j
g?kI:I&bY>d3N2VjijM\Dko_#j!)?d*h"6ssuQ-R7c'U(Y'5lhL'nI'fud2\5ugJ'(tA=;=<
Ttc9M>W-KSd`p,^Jn-UCm(s!rM2EfhZ,qIfkGNTgH)HaX%PR5b*Z`kP[N,pjF-:-^jeHI;kF
ITT\+j4C2J''&X?oht-Og+(K-+tRHZ;W9CnaoMe'/S!T"-j]A5Ad=EmTIReAXn'obbu0QB]A=d
::c%bMO#<l_[`LG,_(@22c@7uWV,$W"/t="?F^:Bum"+J,f<fs&&VT<Nn5VaiE_mo3<p1&'%
2&Mi\0"G*0lhG<c#%>0oP3@ar6*938G79<,g^@e7<`sq[]AJ0f2:p=\PO8$IpKX:rp4*^G=(p
bDPZ:3ZQ'IX$e%F=5OumMaORo$OnXUDFLS*-VGTSE0g/9CjcVS`Ve'1l1MS10p>]AXepciqLn
F(<"p>Xp[:[-oCWXtkLJEb9G/Cir2&O;WEK,'s[mI9nmh,Y5SM>A?j.&@$SfF,P^)";`@q)N
=3DHp^M85P?2".Z(c/CL^/-=Q7%\nn7j_@mXG+[!hbJ55Tgc>VP'!Ia8,GFljK'jH(aj2DFj
d0b'NubTRnmZ;qN<,<JANm\H$i+-#J/b!Uld_fG>2%c<.hj:'k=p$=Y-Ccfn3[C9pnfh89Tk
lATsUS<Ub_K,Yo69T$07cEBYS\JNZfOJWG)K/Sfi+=(@D4\DoH/33O)Ie'UEI"!BTeN]Aq'`2
\K*NTr+.-'26I($er!HKa%ME/tM;4@k2;t`ZLb^/:[[%S?!6usf3DS5mZjcj;W:5#_af@fBL
Hpl:EYI\B='p76OdU-?c`j>X/S8%b3f:77;)+LCD]ASeWi7F96q0tf/.$NIcQEDEr!+nb*B6/
/oVP9K(ApJ^kRGa'BU>`GGgFN(khI\ce=K+N.GD7Ou*@^'PN/@VNnn/n&B8+&2WbG,`<If,8
)D5RECkOmFd`ASIIal#uJf3LHApid\0)BmK2ZH[GE3Hk5*#2$0^l+ARTpn8d!X.h2,3"Pi49
o-O#FT.+n\;L.uNof[hQ0`C&OY!S<Q))7#D3,nS9+>),FP^'#ZY#0P<hVNfV9ES`"+*VNMDE
Ljr'\Nq\0fiU>p>pZ<b*%:m%Gud>E%)W/AWU#YYTiPW@sKc7oM?fW]ABRrhtDI3B1CKYnV/4D
^t#0&KIHYIL0@gE:[DKd2Cr9!;lSYaN,1;98%k-,R/)hSfOgA"fKlisOkj4*,@31%2_Kj3kU
p7m,j)[G6X6NLp1b)mG-IO&$<K(i\-8u5@5D?N-Mh#^JE'mKhD:(ulVV;CN=:\YiinE9)K;%
Z2?Fm1>$'jg^XDZIeu`<;]A&;pY!$E?)A4L5:2*4;,=5XEP[,jI:-MZ<j+CkOcgCI=H=&k>VK
YMQCUg7mWb\H&4)g'1T')So?;UY2H/0E]A2`]AEJ3.rd);E&VT+XWKP25]A9VEB8t-k+EgggQW&
&"c\k<@8MXV1/VQ^;9-%iOe2@>i`5sW]A:lc!B"OZ'K88uNo[p>-o$2(;/PAS*h4dDL?NGNK7
Xj<aViJ>sT<Upm[U_@[gDA!;F^QPN=e<*O.@ABG^mr:LbC0^38``N/<2==p]Ap:TIreL0cjjG
D53TO=j#%.\jO_\(WJl7-_Z`V]A;m#tgfZ>M-Uj4-U<`hF/9eTCqjHWEt]A'0_@t\0d#_lI<MC
p7E7;=R7Pa,iH5Uqi\sTZ>.?\2iG;l59KF.J,2q7qEDl;>@@q0KI43rt9aA>Lj_k*0Nc/51^
L.Qc;5)&QZK_,,kaVB*ds#+@)FPGIr1=2'-pBW(5&r\%il[,Vc=e*n`1dfI.`fNRo*FiZ=^X
[l$d(P)PK/`JV_?=cn(?9oYbDbk/=uJ==!.D1*"DcAW'io4c/C"(p>/B,Jk"Du#-M`Eg=V)J
@VN<b;00A3BNcIG:u!SSo=N]Aj8;g`L_fgRTib[\8%7Fft(%?Rb'&P7nl1#,pao-$kSN?N%L3
q/4?O#E\)*5F,2(=r\^Mrp'r^lMeNu!Xe!scc(CE(>X[!e#ocA==5rY)ANnD*\caX:DpcX8q
no^pZ'*KL/6^(]A8[/p'[_WR&[HnKk[-B0#lj&VI`1e%I!@N0S:qP`uR[3pT!IqHY'u1cJ[%k
%0'h0(hA$2T>;&Y#spSQg<t6S7_=TE^&!8/.Lm`S/&8#,IMf*k',0gPsn6Ini,3f'.,?uCNd
k?4Y14orO]A+mWU;m_X]A'Q)Im9UWJ^%ea?0dNpe'o653_`s/0%7Qn:J=.:,)+jF(CuOlNNJ8W
r@d>Eg:f#s$:@8j(i4Yf#`Gg9>hI=L>W0pJ=kV(G9f&`W2)=AC9\JDkU0m/%`3^9a[kojp[e
V_6"uJ)gi?+(c^qEoX$9$qa#3N?/"nX\`?%g2G-%iD8`ifUL?MIPk_csq4i50Ha&Jr.R9<#@
SbBm9@eX<-sfLN2iUZgunO(,;Y%5YkQhPetkTRA!V/Wpu\Y6H)q+P.UkD^RRC=0hbia#:rO(
u1P%qG$aEpJ)%inQIWo)*;6B[qcSX-jPZ3HprG)GLeVbm7T:FG`H0F4@\g#SVKGq>DK1tr^@
Nk-tJZ_jll/D/gg!smNk?'\<8T.%bseGaI>oia@dAXf#A2'k[O4d[%@]ATnFr_R=7Aoac!pn`
b\!q_3,<Cbb9HeYc26e,.`YMoiB,777(D`7haZT%Y8W++,$<go<r09bbX"iC'a`40K!R=obN
qXG`]A/N`ccQ'aq/=XA;b9jQ(tY?IkZ6IpRJ:T3DWb?=qhcL[4b"CBq*A1IeZ[;E<kA,%c?P^
LRqG3*gdhn,PHHc50g#cDmeT!V</LN`lMCDLF,s60YoVP8^C%87G@RX&?BeKnUm>-umgER6Z
p6.RS&E,>%K#42`UH3us3f..!OuMq1-/e&,;`W)8X2+ob0ik7.5gR2`%6#1m`H&o_fP>O&ln
_@8cWrTr.TA4\s']A2$f0Df\Rj`5pl$ZF(t>,L:AIs9]AKp%5k-hfS`^_2snqGdjY%g/bMTU^L
4f2WBG`VH!?'4_J8s0-eSVLZcl'KdF+eK"(,BAOt<@btP<P2fqjuG@Nm#_s+q*"?!EbZiOG+
YeGj$6P-qM1n$>9e5pcMG&i;V))FAFS-U_!'NKaDLPG=c(&2cF$s[er/jX9MMfhg@E\a!+)W
M/ck4Zb.*+^kBmE)>EO?6`Fe@.E)W)l$^7:ZJZ3rc@6"6mRPcL>;]AVSLX9oPG2S>Zja04*Ao
imjDpp[PpK!RLo4tTk\Hf!hiQ2lj78)Gh2*D@jJoDEEI/_:5dm2nVs8"0Eh>j2QI$)Rr[&f!
hKF?;OlI!bsURBl6o4>#-ej>S\XV7;0#Z/)mW#+.5!r1Z>ZNE_'=37<;DE.;:FV3d3^I%U:p
=&[/%Osur-o:<\A:LAMpSUGr4;<s9CBOD`"H3H((;([`bX8cC6$V'Jk)WVm_L&#dihu\]A/HT
7$G&OG4<X8-(%N4C\,,#%3Ea*,XpqDlo>BHJr]Ak\[bc>(!*gNPF=:O"&+9[VQ30QE;4L's&V
mGoC3r&)#u(6[c-I(aHEQPPl^9-@-8O/)j2@"V9[qp+Ka;9H5W]AT>u1o>-+AF`TL^KJO`#UM
eqL5k<d>JKdDW>2Uhc(]AA.,t)`If<anR!0J0]A2"BEeX_#9>+?9G8V]AF(XcC_fB)[a.2iaTR8
0BX[U>9E]AL;idU'4o(]A14QqrtM&S7[cEg,@7^[i[?50k686ZE@jcHG>=;09*Hh@dC4EP8aQU
YNA4AF77hZBA_fjkW(N8I#:41ieBP#[UukI[A;UG0#o==lsGGf[U*o*2NGm#2'+1gFrVtRFZ
eunA0ua3]A\=U=AB_E;Knf>UDq\cXfO]AUM+.4sl7Blc3lA'P*81AXUr^;Z#"lp`+.eGu92]A7`
1#F3<l_:S2r#euhk(Xcga#]AS]A4@0PE8Q@jbOGAZR]A48>c$rI9o6Yd72KbjE]A#cl^j5=0J3t=
t54Sn&>tXJpWI*&M:0[s8?.nSnT'U<iauirI4~
]]></IM>
</FRImage>
</Background>
<Alpha alpha="1.0"/>
</Border>
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="2">
<FRImage fm="png">
<IM>
<![CDATA[m<IeQ*74C;Om"ZY&knAuU:2OZe<$WH.+)h[M)&8AM'+'I7'ro?LT&US&V?sVNR!4)b96YK0l
QKns2=fnpYkI]Af!EZUHgQ7,HM6%<HQrW03bhE)&eYhgB0)L$,UB2Ps7VG:jSs%<kT<D0P'b?
t1tBCX3W$?d7c9]AC"+A46b_^aC:FT8Ng<M-[3K$."4mtCh"IA.V)ANEJ;cCsol,as(#iGOYn
:R3RS%BT25rl%PrJY>YSAMJ;]APOXS<uiGA4/O#5kH?pu7e`CMQTMKCY_d8C$O,a_*HUiqc]A$
u,FaKdEo.N]A_;Gfi[qMaf.:F>UphK'd*5J2t%3dLts3tA>djF//`BY=Y;rK\c\&XWr,GI9DL
[,3*05UlChKmu!J4;6jr]A21H0^".mQ(*#JH$c(;oK09mS98k+QM&)/\Us]A%D4'oRp:I7:Zot
[Wp/T[#9_e_(%e>T]AelQf-Y"27QLj5N8[j-,Y6i6LA/Y#Y>DGb!fpZfXo(N\lcoRP+&rgF)d
>h44->n%8Km/1uS[_Wb5i`KK4f,k_jr*RB'MEVQADL]A"eEjasdk.luk,#laHAn[KWM?]A%j.[
//M&@"GnEOa85C)?P-Xj7OrcO?`1Af?%Ys.4gp8l?3up83b$BA?+B?a+%"&d!Qafm_5l,f;7
/EE$-)jj;AB?a/"(V0.>>>Y6:h3*4Yg[#hO&qcAcX^o#&,dg^E7CI$?IW`iQ<0de='T?0CSS
/nHc>mr$:k@_PDp2d9J1i"(*0f:>uj,#kG'YP=\[OuK8&^U(s?l.B+]Ai4'+kO[l(1:J)]A\28
Fa;_"Z7*N#9S:hr\j7;774*Q&f.lV:jJh2rZCf<L7o/.p'^@XGU)]A_QqD4+65H*0,R$Y-ao6
.b]Al5meHNp#@Qh\E$mKV0^6.9^6r4625@lXi/T!3;eLL2Q\K(d/JA18Himnpla'4$PMYnK@e
CqA/;_1[#NY5-:B$aD_8uN3U8s[R:MeYnQc)QbnG@/$joY&@Ko!MIjRo5>iXq>.`%j-#'J+l
`=^+*PD>p\Z[O&PO)83,3Was/WZ'^38P\tElu!=L:4m)8/=GGU@LQ<AEXTj9F,A>Q9WfbfY3
d6j2kJ8\GPlN:>hhCADnhD>P+9:-OV\0'RXOU;'=5rqsnB=0SQ`O4IK`RQ"H$#bgYU$Lc*7&
7UOGu/_<'Fa*d)priJai)BW-I<7&gt3^DTaaXV%Acq$eX[k%f=dEu0G.QlI[S>el]AbH/l]Ad7
FoQJ(t_VuH+=Na#)]Ap5:6Y_t-;WGgT3@77JX/u_PJ0:T+I%e=CmhY*K2kj%mCk@Z-N9rI?iU
i)`dQe'k/!ot:J*toG9?KNbc*WWLG]A:urq-Bc"E^F+<=89m$tPc!'&lO2Gb$Dr;/0B'1e/bo
f2aJ;j^^eA8+KR-F&<fqX'!pX,#=5SUu0hT.aUuE0AKf./O9_H]A,!l,bp+[OTQ>NLdY]A(UtB
hjK/WB?*2O9oTq/4R?OH?ofL^$f8E;-h:Gp,@(?^K+AW]AJ&T<oGt?*&p"923V/$RU+;;qD-e
R'-7l62d+k1Jb^./=_+SMfL*:Qgb?gqi?/ha7\rn84g`rc#[+N+cXD^=m%D1%++@Jp!Yh$4k
-+2Zio<!V=X3AP08[TeQTN#`8a37&mK95X2^n&1GX[7r2l("1[p5N\NI6kZN&OOs?O`EkJoq
=]Ao,[J]AltS(a9Wa;W_84%_GU%_0l7=Gg(d?/`#Iq!5tu5P@cHG9>MLRE?&u(B?44\MYFuf4V
r.@@f%A^b6b`S5o5TU&(_'"'PXep6!PG3^*FIq9l#oq$(<6a&(cX`t0Hjh#1]AOcMMkI0k!K'
]A08A"m?e?@M!mGG>+!I4%Ot8`6h?<jLX43&0q(Mo\Nk!sZ[fqO:+90K>"4&]A>?@:t3]AX1MlC
C>gn&MpTU9c6<]A-T+^_g#,\G4C[ERb`ZbN+SH%QslBV,/kb\I,H?Ig,n-5HR3-$jbi@H9EVT
FPMH2H58of>!8^:Z*D5CA^DR?g:'LmV*ocilO/"XJOE^:Q%`jmR0pfYJnXJl9fe6ErXf]Ai?.
MVS;[F;<eO`a;),?$l2]A=,C,[UtWclW6$8=pb"/!F(#Qn_qI?=7QY]AGTWkfPXZa$r=.PYQr,
2Hf&,(F,N'u557YK('!-=0!QR#!LU[;F;$*<=8`3p:7C'&b4WO?MPHrY1%&4LT&:aQTqQMRO
FCp88)%iGJ$RR>M.1X<lKPl4//r72VF$KsDbP\==(aRuE-1.H%M=_j?D"L1\nA:\S,@Zhh7X
JcscE)/lMU9Bgr#?mk7SZO/:3<&2>Y939=jODk4uUZm8B>6W=3,8+1FKr1A5YM+;]A_9C2^!Q
J`/!6rZ[1&<h(l#7AY<%jSIFLr8^j/ulXDmmD^p(sH_'G^*s)ZNH*RCW7Mi.nbN)p,FYVZ&b
@LZ9,<;U['oUfSJ#gK[1gHSD3G23!T(cH@OhBr=AB.;\Kp#llU6sSLRW$MT/CO#&?gWlV#FC
GL5WD.nX*oLKf@G+7q8J"#m'[P?YKu1&gK3pGYIfhjL/XbgHY:Ng/2\1pp5qNY'slqi4ZU$;
44(`56pcGJi=N[c^FQh("EuOb(Mk%J]At(ZqhYhdqU<AsGcFc<3ZO6;Fn+.g5_(bYK8rDY$_(
88?,BQANT_%pBGQ:fZ8iQWIJdj$D:Po`@-"ZqqNDTP#+?j"ns3UOHKj0^i:i%1$D\ofD'A;a
r0>q^mmn796+/)]As]A&L+a[ddtc1FS'Bj@pKq?\q:B[/FpKFRd<r?4rD`SqeXIO)NI0OF//o,
pR]AqGX=Tao&qfC/loqM.$fN3394D>TCP8"EA,e[J^,?FpE#WlPiV>0lWoeV4J7ao;1aIS<q/
EJ+o-W$OT*jiC)71J!W2o5rs/T("XhePlm!aM.bfN<?Z4^nT_0;X?o+jLl+kD2S=#m1r&Q7%
nl"K=Z?L-p!sU)>es'kf=V1C@4)2PkjLV;0n#7_?>NY&#hce-qN+5cg#=.rs+KQZpF#cN?"u
O4e,msr^Xhb]A%3/NIgD0]A_o\CL%Q15lkD(Zs+`.Or[4c(t[L=8+R;CuMW:HQSO;,0r2ACg0[
8rZM+b(D,ik_e%$FI^Q`-rT'?1H#,giY8WG%R_(YlS;14Z&>5h;Jc\/)lpct_UB7NLP=)4lU
lethLR!(,GG,r)b-JTRkhP6h;r;#[A+"aXmCVM-+s>G^Aq9Z^^ntj2dZ3ptg8K3;*K&3UmAn
'1\9^Bj\,76*>Y%:3gq`%c"ad(+,hu4G#=F2'KV6TU+euK:TslINKNuD64TFRAVET5V>D:1W
5n-Jn8dMd;0&KX(#K_L6Gp!O[Cp*lnYAp<,LY\LhGOKZiJI7sPDalJ%\/b#G^]A+#j!MRe_Ml
5Y-^bGod*\`0?4pcCu^:+P7j#OO?`.e[O+_*]A!OX=YJa)WX;*j\K]A&$_c?8lCt7AVYS(rtPm
Q"H_1f?Yrt_>cU/_LL$sZ#BZV=$+lmQ1Y5Db?k.G!#e[M^`t-eg_7@aK8oKupb,d?5qs!p)n
_o8rY7UbrI$DmHl7]A8Gbrn65\dU6jWB?Z\D`_t5=npr)`=B1e3M.$$]A.9J'[__$K-n"/cUXd
>sG@&TI+c#EF_%aeI6SV(9Ro?)-*TOnR@Yr((537D/GBAa>_cP2n2F/)VIfZD4)fg#=7hl*s
?Ag>N7MB$-7+,ogXa2-#7!kab!`(U+3CG.o(7Y@\o>,l;J*nUWp9/]A6/g8:&&&G_g%B^S]A+N
uSo"PH6ro-JLnb;d5*e1,:`WM^[HU\6S:D+Db>pa_,Jqu0?gWHJ":'X4-8mL^J5o))ko)M.\
Lb!9K4(?hnhF7g0QV<2@GQT$E,]A9bQA>f9f$!)AbBs)b8H&"N0k8XW&%%!0]AJ?rJ0NaXhMj$
:?BgB+A0Y.;0/C=p=*4/mZ\0HWO>^H,S6o$5QFRQ\!QA5:e(]A=V)gJ1SQtL_7o:B6:)9XFp8
/Zl(9uV8R.TBi?Kfm<ALms#tJ7IfQ//#&_c&"<,UH\b.C-1gZ[A)jKOSVU_?u!8AFCuTBTh'
/0T;ZV]ABW]AbE,!eM2PNK*^Hg8pB"mQSEng%/;QH[1lBqnW2E:pT5E?QcA&)=cLs/[W]A1aL<g
DQtA2WrAZY>SO8Q#WJ5d2Hl'8.O-K+uA@NQ<bV$:QL5(n`>b`9k1PWr[$TkI.Ii%%ZV-9)TQ
d5Z6j8dkc9De:KBCHS1pfpMIKpDE#m_FYM?2e(6ga"QmE/Pq@(pfNB;Zgnj:SV42V'q&qYJL
Ve')-LEZ.<4^3lm:=)lm@:=2;O/@U`bd'BJr9@,6,&Vo<oXCm8pMh\^1`#RfJ';p>#nhf`lk
\*-1Aru]A%q4#+j[Y8[7Bd*EBCW7j:j!VD;4E#liFn)6Hg#q(#u<C4H2-)Dr-:b$E\$U;FklW
Th$#F"W7#4,>rd`O^)HYellFFf!<4ID?Bd2DQWd\8pu+RXYO)TeTnLWK*pT;q$[;$'bNd9%R
P^4^kDWS?\7>6QQ'2n*EU>X?'!,ZhRaEPY4Ke=ooiErqG_[:BVK+qgq0d4)#GJj?0"%6=+V@
i8AgI#lRYhC1H2He=YSB+T8)6#Zt=$>IaK)/8'uIMQ3kMickJPh%LQ]A*l2[@5U6b0F`?OkRC
O_7H<lHP:c$"W1B`IV@7r!3qB\=2a\m)ZuSu^>(>ADifYk!M*VUaHd`a@6CE'p_['U)WLHu/
D8[2.huZt+fIk'`MsHQej]A>Ri*VZgnd,K^du0"To,*T*QtG#L&goF.Yj.LZW28qc]A#dG]A&`=
a?<9N1hcA6l=D-R'VWMWDJGP_BUKbY8c&,GShp-TqE'utB7R^GN4sL8o3kr999`)J6HCb2<,
sfocpjl/Btfp>$m!/N-HU-^T5;Z#EWtUN6B_Cr]A?8bN1+Gua&TRUr2"lGp+B]AI\[(XM&<LiO
6Hn/V-:T1=]A5=XrbcN6"hmFmnk8;+dmTq0.qkQn]A<r^CAi;9oCr(U:djA6En3-.^Z3KMAiqH
#iQ>-YtcW[Sbh9c(_G[r$f1M'k;NhX=?3KKZlYYI=7]Aa61M"J?b^5kJ,;Tu%>Ua<XUnULS2R
Hm@I6atJ(""-!hbSkh06Z*cF*fQ]A1T9A8J&!'o"'nsKD%O\c_"#5kl.n'A9,^b6^?%`l4IA^
39E&n^(\pT;4/_T>N17uZ"X8DGKLF4F=Is!Ma,,t[86MQ;X2R+a0XVj<I4]A2,$S1:("p@GgL
&tg"#g_8<.#E9h7^>AIR0/`:[GPK%Km6+k&.@]AnnT3nGk[+>D_2[Fa2h8a2V#\4;(*'*c[f1
bYmQfTJ<u)%eX()!4[/[M(Gdr98c&A>9,8H>WJ-Suo]A\gYBX2$%#lW2c,j[/F>E()*Pu(/BQ
.SCmBHZ0@<f3\DVb9f'g>i$W^Vg1V_osZ^,ROZ<gc>3[=(Keg#s,![GH4"c(Wtmfr?3&>pQ"
NTD4Xj/AuX0h2VO[4PZh6KLQn6o"cLdnA`A2'IV@V\9F\7%oB@eJrRV'Z=!`2G*:Q+/Gb1/H
eC)"<+.a*WdSY36-BV^AS#2mna>LQ?J^b.MA%F7LKhj`/W=EB00H=Hlhq&"p_jjpbjfQ4`qu
!76i_6SE4JDEE0hQ,jaXHt+cSdSK]A8>Go3j2>qgT'8Ff^(BQq#2Bpo0'Up'$6;\MM?;Q+3B'
\."Ff!qBK=598m0fC:73r"a98J@mW=L$FcmZNa\>_]A`'_[*cUH#9KVmM2T*<$qieHM@rq;$:
GQV?Pu.__r@?jnk2FRr\F%$lpfjUO0tI<unX8&K2(5TK-)[TRfrpjlFS!^Gbb1#iC;=:^h9j
g?kI:I&bY>d3N2VjijM\Dko_#j!)?d*h"6ssuQ-R7c'U(Y'5lhL'nI'fud2\5ugJ'(tA=;=<
Ttc9M>W-KSd`p,^Jn-UCm(s!rM2EfhZ,qIfkGNTgH)HaX%PR5b*Z`kP[N,pjF-:-^jeHI;kF
ITT\+j4C2J''&X?oht-Og+(K-+tRHZ;W9CnaoMe'/S!T"-j]A5Ad=EmTIReAXn'obbu0QB]A=d
::c%bMO#<l_[`LG,_(@22c@7uWV,$W"/t="?F^:Bum"+J,f<fs&&VT<Nn5VaiE_mo3<p1&'%
2&Mi\0"G*0lhG<c#%>0oP3@ar6*938G79<,g^@e7<`sq[]AJ0f2:p=\PO8$IpKX:rp4*^G=(p
bDPZ:3ZQ'IX$e%F=5OumMaORo$OnXUDFLS*-VGTSE0g/9CjcVS`Ve'1l1MS10p>]AXepciqLn
F(<"p>Xp[:[-oCWXtkLJEb9G/Cir2&O;WEK,'s[mI9nmh,Y5SM>A?j.&@$SfF,P^)";`@q)N
=3DHp^M85P?2".Z(c/CL^/-=Q7%\nn7j_@mXG+[!hbJ55Tgc>VP'!Ia8,GFljK'jH(aj2DFj
d0b'NubTRnmZ;qN<,<JANm\H$i+-#J/b!Uld_fG>2%c<.hj:'k=p$=Y-Ccfn3[C9pnfh89Tk
lATsUS<Ub_K,Yo69T$07cEBYS\JNZfOJWG)K/Sfi+=(@D4\DoH/33O)Ie'UEI"!BTeN]Aq'`2
\K*NTr+.-'26I($er!HKa%ME/tM;4@k2;t`ZLb^/:[[%S?!6usf3DS5mZjcj;W:5#_af@fBL
Hpl:EYI\B='p76OdU-?c`j>X/S8%b3f:77;)+LCD]ASeWi7F96q0tf/.$NIcQEDEr!+nb*B6/
/oVP9K(ApJ^kRGa'BU>`GGgFN(khI\ce=K+N.GD7Ou*@^'PN/@VNnn/n&B8+&2WbG,`<If,8
)D5RECkOmFd`ASIIal#uJf3LHApid\0)BmK2ZH[GE3Hk5*#2$0^l+ARTpn8d!X.h2,3"Pi49
o-O#FT.+n\;L.uNof[hQ0`C&OY!S<Q))7#D3,nS9+>),FP^'#ZY#0P<hVNfV9ES`"+*VNMDE
Ljr'\Nq\0fiU>p>pZ<b*%:m%Gud>E%)W/AWU#YYTiPW@sKc7oM?fW]ABRrhtDI3B1CKYnV/4D
^t#0&KIHYIL0@gE:[DKd2Cr9!;lSYaN,1;98%k-,R/)hSfOgA"fKlisOkj4*,@31%2_Kj3kU
p7m,j)[G6X6NLp1b)mG-IO&$<K(i\-8u5@5D?N-Mh#^JE'mKhD:(ulVV;CN=:\YiinE9)K;%
Z2?Fm1>$'jg^XDZIeu`<;]A&;pY!$E?)A4L5:2*4;,=5XEP[,jI:-MZ<j+CkOcgCI=H=&k>VK
YMQCUg7mWb\H&4)g'1T')So?;UY2H/0E]A2`]AEJ3.rd);E&VT+XWKP25]A9VEB8t-k+EgggQW&
&"c\k<@8MXV1/VQ^;9-%iOe2@>i`5sW]A:lc!B"OZ'K88uNo[p>-o$2(;/PAS*h4dDL?NGNK7
Xj<aViJ>sT<Upm[U_@[gDA!;F^QPN=e<*O.@ABG^mr:LbC0^38``N/<2==p]Ap:TIreL0cjjG
D53TO=j#%.\jO_\(WJl7-_Z`V]A;m#tgfZ>M-Uj4-U<`hF/9eTCqjHWEt]A'0_@t\0d#_lI<MC
p7E7;=R7Pa,iH5Uqi\sTZ>.?\2iG;l59KF.J,2q7qEDl;>@@q0KI43rt9aA>Lj_k*0Nc/51^
L.Qc;5)&QZK_,,kaVB*ds#+@)FPGIr1=2'-pBW(5&r\%il[,Vc=e*n`1dfI.`fNRo*FiZ=^X
[l$d(P)PK/`JV_?=cn(?9oYbDbk/=uJ==!.D1*"DcAW'io4c/C"(p>/B,Jk"Du#-M`Eg=V)J
@VN<b;00A3BNcIG:u!SSo=N]Aj8;g`L_fgRTib[\8%7Fft(%?Rb'&P7nl1#,pao-$kSN?N%L3
q/4?O#E\)*5F,2(=r\^Mrp'r^lMeNu!Xe!scc(CE(>X[!e#ocA==5rY)ANnD*\caX:DpcX8q
no^pZ'*KL/6^(]A8[/p'[_WR&[HnKk[-B0#lj&VI`1e%I!@N0S:qP`uR[3pT!IqHY'u1cJ[%k
%0'h0(hA$2T>;&Y#spSQg<t6S7_=TE^&!8/.Lm`S/&8#,IMf*k',0gPsn6Ini,3f'.,?uCNd
k?4Y14orO]A+mWU;m_X]A'Q)Im9UWJ^%ea?0dNpe'o653_`s/0%7Qn:J=.:,)+jF(CuOlNNJ8W
r@d>Eg:f#s$:@8j(i4Yf#`Gg9>hI=L>W0pJ=kV(G9f&`W2)=AC9\JDkU0m/%`3^9a[kojp[e
V_6"uJ)gi?+(c^qEoX$9$qa#3N?/"nX\`?%g2G-%iD8`ifUL?MIPk_csq4i50Ha&Jr.R9<#@
SbBm9@eX<-sfLN2iUZgunO(,;Y%5YkQhPetkTRA!V/Wpu\Y6H)q+P.UkD^RRC=0hbia#:rO(
u1P%qG$aEpJ)%inQIWo)*;6B[qcSX-jPZ3HprG)GLeVbm7T:FG`H0F4@\g#SVKGq>DK1tr^@
Nk-tJZ_jll/D/gg!smNk?'\<8T.%bseGaI>oia@dAXf#A2'k[O4d[%@]ATnFr_R=7Aoac!pn`
b\!q_3,<Cbb9HeYc26e,.`YMoiB,777(D`7haZT%Y8W++,$<go<r09bbX"iC'a`40K!R=obN
qXG`]A/N`ccQ'aq/=XA;b9jQ(tY?IkZ6IpRJ:T3DWb?=qhcL[4b"CBq*A1IeZ[;E<kA,%c?P^
LRqG3*gdhn,PHHc50g#cDmeT!V</LN`lMCDLF,s60YoVP8^C%87G@RX&?BeKnUm>-umgER6Z
p6.RS&E,>%K#42`UH3us3f..!OuMq1-/e&,;`W)8X2+ob0ik7.5gR2`%6#1m`H&o_fP>O&ln
_@8cWrTr.TA4\s']A2$f0Df\Rj`5pl$ZF(t>,L:AIs9]AKp%5k-hfS`^_2snqGdjY%g/bMTU^L
4f2WBG`VH!?'4_J8s0-eSVLZcl'KdF+eK"(,BAOt<@btP<P2fqjuG@Nm#_s+q*"?!EbZiOG+
YeGj$6P-qM1n$>9e5pcMG&i;V))FAFS-U_!'NKaDLPG=c(&2cF$s[er/jX9MMfhg@E\a!+)W
M/ck4Zb.*+^kBmE)>EO?6`Fe@.E)W)l$^7:ZJZ3rc@6"6mRPcL>;]AVSLX9oPG2S>Zja04*Ao
imjDpp[PpK!RLo4tTk\Hf!hiQ2lj78)Gh2*D@jJoDEEI/_:5dm2nVs8"0Eh>j2QI$)Rr[&f!
hKF?;OlI!bsURBl6o4>#-ej>S\XV7;0#Z/)mW#+.5!r1Z>ZNE_'=37<;DE.;:FV3d3^I%U:p
=&[/%Osur-o:<\A:LAMpSUGr4;<s9CBOD`"H3H((;([`bX8cC6$V'Jk)WVm_L&#dihu\]A/HT
7$G&OG4<X8-(%N4C\,,#%3Ea*,XpqDlo>BHJr]Ak\[bc>(!*gNPF=:O"&+9[VQ30QE;4L's&V
mGoC3r&)#u(6[c-I(aHEQPPl^9-@-8O/)j2@"V9[qp+Ka;9H5W]AT>u1o>-+AF`TL^KJO`#UM
eqL5k<d>JKdDW>2Uhc(]AA.,t)`If<anR!0J0]A2"BEeX_#9>+?9G8V]AF(XcC_fB)[a.2iaTR8
0BX[U>9E]AL;idU'4o(]A14QqrtM&S7[cEg,@7^[i[?50k686ZE@jcHG>=;09*Hh@dC4EP8aQU
YNA4AF77hZBA_fjkW(N8I#:41ieBP#[UukI[A;UG0#o==lsGGf[U*o*2NGm#2'+1gFrVtRFZ
eunA0ua3]A\=U=AB_E;Knf>UDq\cXfO]AUM+.4sl7Blc3lA'P*81AXUr^;Z#"lp`+.eGu92]A7`
1#F3<l_:S2r#euhk(Xcga#]AS]A4@0PE8Q@jbOGAZR]A48>c$rI9o6Yd72KbjE]A#cl^j5=0J3t=
t54Sn&>tXJpWI*&M:0[s8?.nSnT'U<iauirI4~
]]></IM>
</FRImage>
</Background>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[288000,864000,720000,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[720000,2857500,1562100,1295400,2895600,1485900,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="0" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="1" cs="6" s="1">
<O>
<![CDATA[工程售后]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="2" s="2">
<O>
<![CDATA[完工合同金额]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="2" s="3">
<O t="I">
<![CDATA[303]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="2" s="4">
<O>
<![CDATA[万元]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="2" s="2">
<O>
<![CDATA[验收合同金额]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="5" r="2" s="5">
<O t="I">
<![CDATA[280]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="6" r="2" s="4">
<O>
<![CDATA[万元]]></O>
<PrivilegeControl/>
<Expand/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList>
<Style imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="2" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="104" foreground="-1"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="4" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72" foreground="-1"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="120" foreground="-16724737"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="2" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72" foreground="-1"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="120" foreground="-13312"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m94:-;cgQmfIHJ`Q#Siba'1U"a0nbiWM68!8?0+@/0af3H+ZG+HArn$BbN*'EbU;+`p$@#<[
%thW?]AdmRZU72%129D6f!E'UBE94U@'$g^d,'``]AcJ/_iB(6/ZnsPlNb`<CTmDZCVB'4hX=Z
an*3ora,QWF2C'PYgkn>1qd1Ki09AOf7SWd1)"]AJSHF5RTAEgW>mk4G)?$SSM8p:3Z9oKS@l
Z_R^Mh9i"N@SYV\*@dY&n1Nf(Z578bo[J/1$d;4VS',lm+h$#q.#G,]A`$rDhZ>/LPbcG`9&4
1'OU7@7)Lo\_<sr5[JAC42h;r_t&23%Lo0mpq?T-?T2bq!QX5D^<^#]A[3?<Md<-0*+Wp,.O#
/Tk\LW290%&>(q"0qDUPDmUACe=>cAf',JSqVu\XjfW\!>I?Y?2YBuDNf*7IMdQb%F,tKagr
#8CT]A4&,,m@M6D6:E*f/8U&RFf_;oDIWt,EhZmL0Nh7NEEi*59SoX47!E3Y%QR/.=c-/i!\+
'.qNDuV:5_ZN+LhhUk%odq[[VZZaG59gIg39a2\!..tKkA6Tk]A6Ar-DJ&h+*+YD3`jSt!F8"
Ui:9OeX%^6ma(!Yp8o,jd*HoGC3FYc_YfMa42te+Sq<pU.PZ56;aS!2TP8h43umZXIJRMS67
htc>WM?<F#!'_+DUF&lQ&(+q7V$YAbE"),Goi)$B8iM.BMQYC!]A9o_`a*-NB9arpl:!a]A,UC
W$C2E80XH?(/t!30i>8T=O90A]AuTR;4SL@W]A$UeIa96]ArU;;bl;ZX?p,!AD2S1!OVmf'R8;I
u=QDapVepK8.+PnaD/dB:$NR;uAH2'p\ehitLeA93FHAq*0R\;*Zl"7?gRp1\_Ah(A\H`5S+
S[_B>%dn5pST()bt>uc_]Akq>$Y^*WX6lH>5*dQG=$Nc`L9B/ah<:bdk[l3R@"8d$]AF;&8Dj.
D3n_-`49BWMWqbOD2+bjSC2O[n$VL()O1M;dk^8MYtY%&=t"b>UT[(Eo\8<$mN5ro0E-&IO2
sF^:(dtF!Ceq+3lp8p6KZ]AH1U/nSkUER(;XqooiI\hS!c[i5pUm`O^&n*^Y*g/8gI>PG8H?3
[R@"^[rpBL2dQ8TVIF^eI5tp%Z9f`q1kEoE`nT4jai0nkAEBLh>YZP#OkOOK,o[8&4ao+g)g
ZM7Zco$\ATM#+>'@:jf4MPgqI5G0Tu3+:OMUL;led%OgL6\e6b#Kg2b1sY`ata#Mt%i*FD,1
)&JXKh=9%GI*p\+k[&):K`]AE:4Qujtfl[Rpci($kOhR6JO=I[&tVDTYiTtbgn+O?*BV#%EqF
e#B46GlP-IXNId\*A1hZ6"Hf^EE^0j#1`2)E:H("3:0booZR;Hc,]A6)cB>d$5dn0]A]A;@7Et@
YDPHtc_r.?Ud4SSqY[sWT`i6#.CagNnpTc4#&E\XHVmK-l-A#o'dY;PRjU557\\]Al[Ql2Ho)
ho&*8n0c_C=dKYs'8F^oCBaHWHejc$<uamnl'a]APV1Z,*G2Wk7W^`UGP`TEha4iUtlCRlGQ-
TX/r#u.?ZPK"C@[#)!q;LJ\??,I/a,lkp$cp0o)\1_B)Z"_?!&un@^+DGCd%'N>SC^!n\PS5
[[Uk;,o/bjdesn$_`s/&n0KldbE=^Z59a4W<eGjBAK;-,dJiGRqC[uC2P`Wt?<#VT`?SH*g-
NiPM"*G(3H,i$]A;>23sjLGRf^H@uc+@?X_oQA-Cm5bp2V7E6JlX%%T^ri\aO2MbWR4KhY,<k
TVN4*#BB(%-/%$A[d+m&]AN8'@<iSF]A@6EX:8Y2Tk6"U'-]AoTo1ue#P\tTbG=sFKTE2,!laRb
3N>`5"#]Ab[p:G)<59hZ#I.)LT3$5`)ijb?p]Ao3ShT\n)c)$]Arm1$RSQq#[13&dOPVGBq^g@p
d0IM]A^+O#SH<PZ8Dj$VTRh,MS(hWEkUt4LpUKumU=T.?]A=_@dgQXWmoaEc8*,LeDNL"S\uJ%
8qR4LG?7gph6Xregq;#%AQ9jJRL5R_BY_EWn"?P:`#D/ufCE:N4>mX]A%/h97Xe;3CGcX[SJc
H:tX'#C)(0N]A^1P\n-2U+@_jOO&Eom9+05QRi!:>+_5UQWhcp,BsSN&IRaXY(P>]ACl`)]AB^;
s&,23i8[U5fPnG[;tHCKgj41O!o,Ep1g@8r.:Ek\(C_$l'Fb9^HkJ:"?QW=mZ[P1$%/_\o"`
NfOsrW]At.$$YU?fTuacfNPKQbIc(b,WMTWreg4&526sYHC.]Ao^!=ZTYRm\leVEo1%KXJ"TQ<
AErAf`]AGiFZt!]AH>uX#P^G6GtEt)CsH=JF>5V@;M?e&1l"%L)\Gg6*/iif%")2d;"W.]A/TLt
Olbk"mJ[+T(*R_@'bt)Eu'i$i?)skkpQQY)pHo)X5kDPe%I@jlTNA_j?N:4._=F3%!H>e\%J
`FtCW(0CB:p!g/eLuqQIgN!'bUqcP=4TF\HWkIO9'>id>'FaGOhBKAK9&XaKl3fW7!t8c%_)
o7Dh"7^;]A6h[^(C'&Ee\YG`h!SiqEWgm"@3["Dmdj2dJ4cn$e$('aR\PA-<n&$^"/\(ZUolX
4cm5*="[IQ5P11!$mfmV+C@goRbdLl`I?R%nQpC5r1:r=ml4JqkAc`$YN.B3jK4D[eT;8.\A
lFoR;D&(jVedO-Q"AO>8N2$m9TF!+ef]AuX2);5^Q-3R^*`Q;;8=r8%[tgOD%ZU_,4Z=m^C*?
OgBM8GZ]AU`*@_YQ:jZQRu31(,g?gQ(`7dO9#mW'6-AXgBWi3*c+kf"ULWZUXp?o`73X\0NW+
@*nMA3/qaTLCJ-(_"cKl^'\/cmI/UZH]Au`!HcGF;q>2&7%J2UQQ/&:_%9M@hEDZ?HR70)k'M
38=&tOh!rK`rJd6n<^`A"5Q!+hU!pO/!f9Ug(`4]A1$Gbsclj6TF'8<#@/P,YJ;:EOOQEapl6
=6o`.YY=D@,VohOa5m-TG(!>C0hQ<\"tUeQr;qr.%.`CfLMmOgX+0lgJ/Eb^TR+U?b"M?/52
Kk@,t3IRb8=D0"h=L&;`.pK8E1$`1Gk?+bbtdCak2S&=RpX:ognX#"2L)(@C>-T5V?MG01ot
qal\:eU'9'Ia6j,2Vo;!4]A:pK)'R-=ih0VTteba58I<tbq(!G)V/A"qo^r:>ejU;@7f?ql6%
dUh=4+u0?fi4YY(WAi]Af9Q76.HPOf^&BFGe#.Q"&3M:K=REUGBmB-pEe8;N*3<Xu"bP!-Gbh
T:V,&K?eTLCaK)?N(>F>$,7P(KOM.E(<A0RR=D9"sN_4$2Z?U+)F;[C^<7]A]A!$&D;gro,.0H
B8AH@GlX(`()`%TDT#^.S^YO=APO4G4&G@3J<6#IKTD?u#d-Q`(\'S4AB.W!4rgZ&.jmnq_Z
Rg&GZ=XVf)/e3j4S7H$N[`mh9f;BRt'E``gbaKNTOYZ?nhJK>1#="G3#P&5Q[)$OIOoGb00Q
M,Bda`9_p5qq"?N3DdcBN(4=Ti@GVMA&"?OI?]Ab0_$QV3*%FNG$AIiaB-VT<#K?2m(),mLsP
9$UChuO.lGsTBc%hn,7/-[]A,Ko865)+(R9h+PaB26G[&3ehR%m46;GH_.W\gFj\2i)\%N1/3
"d]AWu'=dEcOL`MSI'H-Xgrh5FXV%9\%R'P4b#>'+C9:8MrV3gtndZF.lpWV?hPT.;4N7:FN7
V=RQK0kqWoViE5SNW<WMJDu\@*7i!kaj+,e9W[3n/+jVQ7uWo.B\/[IBkbC:+u,/cW[]A9XEi
U%Oo=,]AR,Sbc+4$!GBn-q-;]Au@E.*M4nL>[-N-=NNtBKBUoX17dg%LfqZPMt%SHr11?M3&aI
*(80?).7c,0lL.B4Y\4Knl`^l:3>DsHick4HP2gZNL<U@)VCM0I:AnjZJt?>Nnp\DaTB6M-d
VR.e>o'!uWL,?r4fnK]A`ajGiN5CO9pB0"K1'=S8@i6T`q(iLel-oaM>%:T=Udf_'!GJiu]A_6
[<lcSWr.NKnWIPs:a+dgII`ce6+U4QjO>+nL_X@VNXa(L4cC\/<@.C`1N$tV>\6n0"^5o11h
96_=.D!'Qn%n11e+C7#XFRR7%m#34B:M@dj;'<\5pcQnIDX]Amq5t\@f1HrtYadmoiV`se=+R
+3<GXLdsr%9CTP*cFZ^@_oB8R]AA/T+(@oa,+'i1XgUB&M`p*`/pCT#(2"oO`hMPf!s3F)$E;
$;2]Aaib>ZTA;ZQQp0MI]A><XdSE6hLJ[3NdIo9GFM3$$(]ALINehK1KA.%g^!>VB`LN'@.@(G%
)Eh"KsZ-8]AnTfN>Y0jqkkTiH\sS.n84A#>r;p_^3)cBNeITC>K_\QL4b-9AX0;SZ>CMHR>iS
h1'KWXg[:"P483A>a89Mk[/:J*;^ZMCF"E87iJ'LB#o,EF?T$"9>-LY!saIVCQZm1LN-;$7P
gSV(kA!"@3&QC,P3oUeJbC_2W9gE7-5<Y[Q^%)0CatZ7f6I:rKR^YtNj9ErV>BMMB`PLN;!s
JkHF`V>Xd.3NBeM!pqd)<@)basDj6c?SNX[U^6Ya%0aj!a:DdW4k#e6uJX]Ai'HWDRq@Z!8e4
4f`Jg*CK3?pKA9=_`2Y2E<Q`-J]A>dHKr`o@X4VcoHq/27R6f5;$1+nG\Q"t0##D(SYpK(7-`
(k8#2DqpET1>jh;j$fp?LOF6pBKRq'N'D0nH:]AT4sQg35?a,d[3puMN5;t]A[V-:j'>Ae\7\R
,7%mtFJ5O6;#Cg'*dcp'k'/f>-Rq<BWKbOI5ScDc]A8>nGNBSg8K+LASl]AW_S]Ale>JF&rX%s?
)LUKK#rH$J54OT8d48+QMBmiY\>MJs"Rn!+U*/'e:_F[%^U5F9@b-./#K@X8/dE,ta2#44mD
;YUj=!]A+S1&cM$?2VL.J?nR'^-BJ,B]A\g7?bUI$)/Tg"eKE>jo0"bJhqrcn-:LdFrh]A`g8d<
!E@OVpT\;iV$rV@Gm3hpWQPm(7b<I60hZL(QIO-9GV*m(iKB:cA'%mo2$si[/,M*o"erJ%k9
6J&p\[!/0mgi/hM@'^M$!saRbJ0IXAVE.Dp)n=*?tIt_1eG_&j)(K\ggc^7&t(jd'3M$uT7c
2%.Cn5uK_&5e,a\CBE]AJi(0:@\HH)Pm=0?D>d.ltA\\KeO:#Hhm]A/tl@s[_o"b_-RENaN:_&
05V*\VKC>I6Cd3h$Ar)6#JU[&nqd*5m6E[<!^\$EB.Jh,LB#%9[2FRij,dJ8,"4'oa2OVYc,
qeFJrl<mTN5\]AG)3Tb$S3COf(>TRi'&/.d)F0l,OjGEpr>ZI<3%P2aOO\[ZZ/=Y80#1m+1?u
<YQ]AAcL'f=hI=!?KI,'d=F^!JgSa19k;hjG']AcK[,UDS#+R\5QibgLeh%%i]AYi=r+bAd3+Sk
5@)TU\h:1P!7]A36UFP^(33Sh.K;"'rE8[IWcq5lrTMT-%f~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="250" height="150"/>
</Widget>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[723900,723900,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList/>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList/>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="11" y="354" width="203" height="166"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<Listener event="afterinit">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters/>
<Content>
<![CDATA[setTimeout(function() {
    //隐藏报表块report0_c的滚动条（此报表块名为report0_c，根据具体情况修改）
    $("div[widgetname=REPORT2]A").find(".frozen-north")[0]A.style.overflow = "hidden";
    $("div[widgetname=REPORT2]A").find(".frozen-center")[0]A.style.overflow = "hidden";
}, 1000);

window.flag = true;
//鼠标悬停，滚动停止  
setTimeout(function() {
    $(".frozen-center").mouseover(function() {
        window.flag = false;
    });

    //鼠标离开，继续滚动  
    $(".frozen-center").mouseleave(function() {
        window.flag = true;
    });

    var old = -1;
    var interval = setInterval(function() {
        if(window.flag) {
            currentpos = $("div[widgetname=REPORT2]A").find(".frozen-center")[0]A.scrollTop;
            if(currentpos == old) {
                $("div[widgetname=REPORT2]A").find(".frozen-center")[0]A.scrollTop = 0;
            } else {
                old = currentpos;
                //以25ms的速度每次滚动1.5PX  
                $("div[widgetname=REPORT2]A").find(".frozen-center")[0]A.scrollTop = currentpos + 1.5;
            }
        }
    }, 40);
}, 1000);]]></Content>
</JavaScript>
</Listener>
<WidgetName name="report2_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report2_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="宋体" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="2">
<FRImage fm="png">
<IM>
<![CDATA[m<IeQ*74C;Om"ZY&knAuU:2OZe<$WH.+)h[M)&8AM'+'I7'ro?LT&US&V?sVNR!4)b96YK0l
QKns2=fnpYkI]Af!EZUHgQ7,HM6%<HQrW03bhE)&eYhgB0)L$,UB2Ps7VG:jSs%<kT<D0P'b?
t1tBCX3W$?d7c9]AC"+A46b_^aC:FT8Ng<M-[3K$."4mtCh"IA.V)ANEJ;cCsol,as(#iGOYn
:R3RS%BT25rl%PrJY>YSAMJ;]APOXS<uiGA4/O#5kH?pu7e`CMQTMKCY_d8C$O,a_*HUiqc]A$
u,FaKdEo.N]A_;Gfi[qMaf.:F>UphK'd*5J2t%3dLts3tA>djF//`BY=Y;rK\c\&XWr,GI9DL
[,3*05UlChKmu!J4;6jr]A21H0^".mQ(*#JH$c(;oK09mS98k+QM&)/\Us]A%D4'oRp:I7:Zot
[Wp/T[#9_e_(%e>T]AelQf-Y"27QLj5N8[j-,Y6i6LA/Y#Y>DGb!fpZfXo(N\lcoRP+&rgF)d
>h44->n%8Km/1uS[_Wb5i`KK4f,k_jr*RB'MEVQADL]A"eEjasdk.luk,#laHAn[KWM?]A%j.[
//M&@"GnEOa85C)?P-Xj7OrcO?`1Af?%Ys.4gp8l?3up83b$BA?+B?a+%"&d!Qafm_5l,f;7
/EE$-)jj;AB?a/"(V0.>>>Y6:h3*4Yg[#hO&qcAcX^o#&,dg^E7CI$?IW`iQ<0de='T?0CSS
/nHc>mr$:k@_PDp2d9J1i"(*0f:>uj,#kG'YP=\[OuK8&^U(s?l.B+]Ai4'+kO[l(1:J)]A\28
Fa;_"Z7*N#9S:hr\j7;774*Q&f.lV:jJh2rZCf<L7o/.p'^@XGU)]A_QqD4+65H*0,R$Y-ao6
.b]Al5meHNp#@Qh\E$mKV0^6.9^6r4625@lXi/T!3;eLL2Q\K(d/JA18Himnpla'4$PMYnK@e
CqA/;_1[#NY5-:B$aD_8uN3U8s[R:MeYnQc)QbnG@/$joY&@Ko!MIjRo5>iXq>.`%j-#'J+l
`=^+*PD>p\Z[O&PO)83,3Was/WZ'^38P\tElu!=L:4m)8/=GGU@LQ<AEXTj9F,A>Q9WfbfY3
d6j2kJ8\GPlN:>hhCADnhD>P+9:-OV\0'RXOU;'=5rqsnB=0SQ`O4IK`RQ"H$#bgYU$Lc*7&
7UOGu/_<'Fa*d)priJai)BW-I<7&gt3^DTaaXV%Acq$eX[k%f=dEu0G.QlI[S>el]AbH/l]Ad7
FoQJ(t_VuH+=Na#)]Ap5:6Y_t-;WGgT3@77JX/u_PJ0:T+I%e=CmhY*K2kj%mCk@Z-N9rI?iU
i)`dQe'k/!ot:J*toG9?KNbc*WWLG]A:urq-Bc"E^F+<=89m$tPc!'&lO2Gb$Dr;/0B'1e/bo
f2aJ;j^^eA8+KR-F&<fqX'!pX,#=5SUu0hT.aUuE0AKf./O9_H]A,!l,bp+[OTQ>NLdY]A(UtB
hjK/WB?*2O9oTq/4R?OH?ofL^$f8E;-h:Gp,@(?^K+AW]AJ&T<oGt?*&p"923V/$RU+;;qD-e
R'-7l62d+k1Jb^./=_+SMfL*:Qgb?gqi?/ha7\rn84g`rc#[+N+cXD^=m%D1%++@Jp!Yh$4k
-+2Zio<!V=X3AP08[TeQTN#`8a37&mK95X2^n&1GX[7r2l("1[p5N\NI6kZN&OOs?O`EkJoq
=]Ao,[J]AltS(a9Wa;W_84%_GU%_0l7=Gg(d?/`#Iq!5tu5P@cHG9>MLRE?&u(B?44\MYFuf4V
r.@@f%A^b6b`S5o5TU&(_'"'PXep6!PG3^*FIq9l#oq$(<6a&(cX`t0Hjh#1]AOcMMkI0k!K'
]A08A"m?e?@M!mGG>+!I4%Ot8`6h?<jLX43&0q(Mo\Nk!sZ[fqO:+90K>"4&]A>?@:t3]AX1MlC
C>gn&MpTU9c6<]A-T+^_g#,\G4C[ERb`ZbN+SH%QslBV,/kb\I,H?Ig,n-5HR3-$jbi@H9EVT
FPMH2H58of>!8^:Z*D5CA^DR?g:'LmV*ocilO/"XJOE^:Q%`jmR0pfYJnXJl9fe6ErXf]Ai?.
MVS;[F;<eO`a;),?$l2]A=,C,[UtWclW6$8=pb"/!F(#Qn_qI?=7QY]AGTWkfPXZa$r=.PYQr,
2Hf&,(F,N'u557YK('!-=0!QR#!LU[;F;$*<=8`3p:7C'&b4WO?MPHrY1%&4LT&:aQTqQMRO
FCp88)%iGJ$RR>M.1X<lKPl4//r72VF$KsDbP\==(aRuE-1.H%M=_j?D"L1\nA:\S,@Zhh7X
JcscE)/lMU9Bgr#?mk7SZO/:3<&2>Y939=jODk4uUZm8B>6W=3,8+1FKr1A5YM+;]A_9C2^!Q
J`/!6rZ[1&<h(l#7AY<%jSIFLr8^j/ulXDmmD^p(sH_'G^*s)ZNH*RCW7Mi.nbN)p,FYVZ&b
@LZ9,<;U['oUfSJ#gK[1gHSD3G23!T(cH@OhBr=AB.;\Kp#llU6sSLRW$MT/CO#&?gWlV#FC
GL5WD.nX*oLKf@G+7q8J"#m'[P?YKu1&gK3pGYIfhjL/XbgHY:Ng/2\1pp5qNY'slqi4ZU$;
44(`56pcGJi=N[c^FQh("EuOb(Mk%J]At(ZqhYhdqU<AsGcFc<3ZO6;Fn+.g5_(bYK8rDY$_(
88?,BQANT_%pBGQ:fZ8iQWIJdj$D:Po`@-"ZqqNDTP#+?j"ns3UOHKj0^i:i%1$D\ofD'A;a
r0>q^mmn796+/)]As]A&L+a[ddtc1FS'Bj@pKq?\q:B[/FpKFRd<r?4rD`SqeXIO)NI0OF//o,
pR]AqGX=Tao&qfC/loqM.$fN3394D>TCP8"EA,e[J^,?FpE#WlPiV>0lWoeV4J7ao;1aIS<q/
EJ+o-W$OT*jiC)71J!W2o5rs/T("XhePlm!aM.bfN<?Z4^nT_0;X?o+jLl+kD2S=#m1r&Q7%
nl"K=Z?L-p!sU)>es'kf=V1C@4)2PkjLV;0n#7_?>NY&#hce-qN+5cg#=.rs+KQZpF#cN?"u
O4e,msr^Xhb]A%3/NIgD0]A_o\CL%Q15lkD(Zs+`.Or[4c(t[L=8+R;CuMW:HQSO;,0r2ACg0[
8rZM+b(D,ik_e%$FI^Q`-rT'?1H#,giY8WG%R_(YlS;14Z&>5h;Jc\/)lpct_UB7NLP=)4lU
lethLR!(,GG,r)b-JTRkhP6h;r;#[A+"aXmCVM-+s>G^Aq9Z^^ntj2dZ3ptg8K3;*K&3UmAn
'1\9^Bj\,76*>Y%:3gq`%c"ad(+,hu4G#=F2'KV6TU+euK:TslINKNuD64TFRAVET5V>D:1W
5n-Jn8dMd;0&KX(#K_L6Gp!O[Cp*lnYAp<,LY\LhGOKZiJI7sPDalJ%\/b#G^]A+#j!MRe_Ml
5Y-^bGod*\`0?4pcCu^:+P7j#OO?`.e[O+_*]A!OX=YJa)WX;*j\K]A&$_c?8lCt7AVYS(rtPm
Q"H_1f?Yrt_>cU/_LL$sZ#BZV=$+lmQ1Y5Db?k.G!#e[M^`t-eg_7@aK8oKupb,d?5qs!p)n
_o8rY7UbrI$DmHl7]A8Gbrn65\dU6jWB?Z\D`_t5=npr)`=B1e3M.$$]A.9J'[__$K-n"/cUXd
>sG@&TI+c#EF_%aeI6SV(9Ro?)-*TOnR@Yr((537D/GBAa>_cP2n2F/)VIfZD4)fg#=7hl*s
?Ag>N7MB$-7+,ogXa2-#7!kab!`(U+3CG.o(7Y@\o>,l;J*nUWp9/]A6/g8:&&&G_g%B^S]A+N
uSo"PH6ro-JLnb;d5*e1,:`WM^[HU\6S:D+Db>pa_,Jqu0?gWHJ":'X4-8mL^J5o))ko)M.\
Lb!9K4(?hnhF7g0QV<2@GQT$E,]A9bQA>f9f$!)AbBs)b8H&"N0k8XW&%%!0]AJ?rJ0NaXhMj$
:?BgB+A0Y.;0/C=p=*4/mZ\0HWO>^H,S6o$5QFRQ\!QA5:e(]A=V)gJ1SQtL_7o:B6:)9XFp8
/Zl(9uV8R.TBi?Kfm<ALms#tJ7IfQ//#&_c&"<,UH\b.C-1gZ[A)jKOSVU_?u!8AFCuTBTh'
/0T;ZV]ABW]AbE,!eM2PNK*^Hg8pB"mQSEng%/;QH[1lBqnW2E:pT5E?QcA&)=cLs/[W]A1aL<g
DQtA2WrAZY>SO8Q#WJ5d2Hl'8.O-K+uA@NQ<bV$:QL5(n`>b`9k1PWr[$TkI.Ii%%ZV-9)TQ
d5Z6j8dkc9De:KBCHS1pfpMIKpDE#m_FYM?2e(6ga"QmE/Pq@(pfNB;Zgnj:SV42V'q&qYJL
Ve')-LEZ.<4^3lm:=)lm@:=2;O/@U`bd'BJr9@,6,&Vo<oXCm8pMh\^1`#RfJ';p>#nhf`lk
\*-1Aru]A%q4#+j[Y8[7Bd*EBCW7j:j!VD;4E#liFn)6Hg#q(#u<C4H2-)Dr-:b$E\$U;FklW
Th$#F"W7#4,>rd`O^)HYellFFf!<4ID?Bd2DQWd\8pu+RXYO)TeTnLWK*pT;q$[;$'bNd9%R
P^4^kDWS?\7>6QQ'2n*EU>X?'!,ZhRaEPY4Ke=ooiErqG_[:BVK+qgq0d4)#GJj?0"%6=+V@
i8AgI#lRYhC1H2He=YSB+T8)6#Zt=$>IaK)/8'uIMQ3kMickJPh%LQ]A*l2[@5U6b0F`?OkRC
O_7H<lHP:c$"W1B`IV@7r!3qB\=2a\m)ZuSu^>(>ADifYk!M*VUaHd`a@6CE'p_['U)WLHu/
D8[2.huZt+fIk'`MsHQej]A>Ri*VZgnd,K^du0"To,*T*QtG#L&goF.Yj.LZW28qc]A#dG]A&`=
a?<9N1hcA6l=D-R'VWMWDJGP_BUKbY8c&,GShp-TqE'utB7R^GN4sL8o3kr999`)J6HCb2<,
sfocpjl/Btfp>$m!/N-HU-^T5;Z#EWtUN6B_Cr]A?8bN1+Gua&TRUr2"lGp+B]AI\[(XM&<LiO
6Hn/V-:T1=]A5=XrbcN6"hmFmnk8;+dmTq0.qkQn]A<r^CAi;9oCr(U:djA6En3-.^Z3KMAiqH
#iQ>-YtcW[Sbh9c(_G[r$f1M'k;NhX=?3KKZlYYI=7]Aa61M"J?b^5kJ,;Tu%>Ua<XUnULS2R
Hm@I6atJ(""-!hbSkh06Z*cF*fQ]A1T9A8J&!'o"'nsKD%O\c_"#5kl.n'A9,^b6^?%`l4IA^
39E&n^(\pT;4/_T>N17uZ"X8DGKLF4F=Is!Ma,,t[86MQ;X2R+a0XVj<I4]A2,$S1:("p@GgL
&tg"#g_8<.#E9h7^>AIR0/`:[GPK%Km6+k&.@]AnnT3nGk[+>D_2[Fa2h8a2V#\4;(*'*c[f1
bYmQfTJ<u)%eX()!4[/[M(Gdr98c&A>9,8H>WJ-Suo]A\gYBX2$%#lW2c,j[/F>E()*Pu(/BQ
.SCmBHZ0@<f3\DVb9f'g>i$W^Vg1V_osZ^,ROZ<gc>3[=(Keg#s,![GH4"c(Wtmfr?3&>pQ"
NTD4Xj/AuX0h2VO[4PZh6KLQn6o"cLdnA`A2'IV@V\9F\7%oB@eJrRV'Z=!`2G*:Q+/Gb1/H
eC)"<+.a*WdSY36-BV^AS#2mna>LQ?J^b.MA%F7LKhj`/W=EB00H=Hlhq&"p_jjpbjfQ4`qu
!76i_6SE4JDEE0hQ,jaXHt+cSdSK]A8>Go3j2>qgT'8Ff^(BQq#2Bpo0'Up'$6;\MM?;Q+3B'
\."Ff!qBK=598m0fC:73r"a98J@mW=L$FcmZNa\>_]A`'_[*cUH#9KVmM2T*<$qieHM@rq;$:
GQV?Pu.__r@?jnk2FRr\F%$lpfjUO0tI<unX8&K2(5TK-)[TRfrpjlFS!^Gbb1#iC;=:^h9j
g?kI:I&bY>d3N2VjijM\Dko_#j!)?d*h"6ssuQ-R7c'U(Y'5lhL'nI'fud2\5ugJ'(tA=;=<
Ttc9M>W-KSd`p,^Jn-UCm(s!rM2EfhZ,qIfkGNTgH)HaX%PR5b*Z`kP[N,pjF-:-^jeHI;kF
ITT\+j4C2J''&X?oht-Og+(K-+tRHZ;W9CnaoMe'/S!T"-j]A5Ad=EmTIReAXn'obbu0QB]A=d
::c%bMO#<l_[`LG,_(@22c@7uWV,$W"/t="?F^:Bum"+J,f<fs&&VT<Nn5VaiE_mo3<p1&'%
2&Mi\0"G*0lhG<c#%>0oP3@ar6*938G79<,g^@e7<`sq[]AJ0f2:p=\PO8$IpKX:rp4*^G=(p
bDPZ:3ZQ'IX$e%F=5OumMaORo$OnXUDFLS*-VGTSE0g/9CjcVS`Ve'1l1MS10p>]AXepciqLn
F(<"p>Xp[:[-oCWXtkLJEb9G/Cir2&O;WEK,'s[mI9nmh,Y5SM>A?j.&@$SfF,P^)";`@q)N
=3DHp^M85P?2".Z(c/CL^/-=Q7%\nn7j_@mXG+[!hbJ55Tgc>VP'!Ia8,GFljK'jH(aj2DFj
d0b'NubTRnmZ;qN<,<JANm\H$i+-#J/b!Uld_fG>2%c<.hj:'k=p$=Y-Ccfn3[C9pnfh89Tk
lATsUS<Ub_K,Yo69T$07cEBYS\JNZfOJWG)K/Sfi+=(@D4\DoH/33O)Ie'UEI"!BTeN]Aq'`2
\K*NTr+.-'26I($er!HKa%ME/tM;4@k2;t`ZLb^/:[[%S?!6usf3DS5mZjcj;W:5#_af@fBL
Hpl:EYI\B='p76OdU-?c`j>X/S8%b3f:77;)+LCD]ASeWi7F96q0tf/.$NIcQEDEr!+nb*B6/
/oVP9K(ApJ^kRGa'BU>`GGgFN(khI\ce=K+N.GD7Ou*@^'PN/@VNnn/n&B8+&2WbG,`<If,8
)D5RECkOmFd`ASIIal#uJf3LHApid\0)BmK2ZH[GE3Hk5*#2$0^l+ARTpn8d!X.h2,3"Pi49
o-O#FT.+n\;L.uNof[hQ0`C&OY!S<Q))7#D3,nS9+>),FP^'#ZY#0P<hVNfV9ES`"+*VNMDE
Ljr'\Nq\0fiU>p>pZ<b*%:m%Gud>E%)W/AWU#YYTiPW@sKc7oM?fW]ABRrhtDI3B1CKYnV/4D
^t#0&KIHYIL0@gE:[DKd2Cr9!;lSYaN,1;98%k-,R/)hSfOgA"fKlisOkj4*,@31%2_Kj3kU
p7m,j)[G6X6NLp1b)mG-IO&$<K(i\-8u5@5D?N-Mh#^JE'mKhD:(ulVV;CN=:\YiinE9)K;%
Z2?Fm1>$'jg^XDZIeu`<;]A&;pY!$E?)A4L5:2*4;,=5XEP[,jI:-MZ<j+CkOcgCI=H=&k>VK
YMQCUg7mWb\H&4)g'1T')So?;UY2H/0E]A2`]AEJ3.rd);E&VT+XWKP25]A9VEB8t-k+EgggQW&
&"c\k<@8MXV1/VQ^;9-%iOe2@>i`5sW]A:lc!B"OZ'K88uNo[p>-o$2(;/PAS*h4dDL?NGNK7
Xj<aViJ>sT<Upm[U_@[gDA!;F^QPN=e<*O.@ABG^mr:LbC0^38``N/<2==p]Ap:TIreL0cjjG
D53TO=j#%.\jO_\(WJl7-_Z`V]A;m#tgfZ>M-Uj4-U<`hF/9eTCqjHWEt]A'0_@t\0d#_lI<MC
p7E7;=R7Pa,iH5Uqi\sTZ>.?\2iG;l59KF.J,2q7qEDl;>@@q0KI43rt9aA>Lj_k*0Nc/51^
L.Qc;5)&QZK_,,kaVB*ds#+@)FPGIr1=2'-pBW(5&r\%il[,Vc=e*n`1dfI.`fNRo*FiZ=^X
[l$d(P)PK/`JV_?=cn(?9oYbDbk/=uJ==!.D1*"DcAW'io4c/C"(p>/B,Jk"Du#-M`Eg=V)J
@VN<b;00A3BNcIG:u!SSo=N]Aj8;g`L_fgRTib[\8%7Fft(%?Rb'&P7nl1#,pao-$kSN?N%L3
q/4?O#E\)*5F,2(=r\^Mrp'r^lMeNu!Xe!scc(CE(>X[!e#ocA==5rY)ANnD*\caX:DpcX8q
no^pZ'*KL/6^(]A8[/p'[_WR&[HnKk[-B0#lj&VI`1e%I!@N0S:qP`uR[3pT!IqHY'u1cJ[%k
%0'h0(hA$2T>;&Y#spSQg<t6S7_=TE^&!8/.Lm`S/&8#,IMf*k',0gPsn6Ini,3f'.,?uCNd
k?4Y14orO]A+mWU;m_X]A'Q)Im9UWJ^%ea?0dNpe'o653_`s/0%7Qn:J=.:,)+jF(CuOlNNJ8W
r@d>Eg:f#s$:@8j(i4Yf#`Gg9>hI=L>W0pJ=kV(G9f&`W2)=AC9\JDkU0m/%`3^9a[kojp[e
V_6"uJ)gi?+(c^qEoX$9$qa#3N?/"nX\`?%g2G-%iD8`ifUL?MIPk_csq4i50Ha&Jr.R9<#@
SbBm9@eX<-sfLN2iUZgunO(,;Y%5YkQhPetkTRA!V/Wpu\Y6H)q+P.UkD^RRC=0hbia#:rO(
u1P%qG$aEpJ)%inQIWo)*;6B[qcSX-jPZ3HprG)GLeVbm7T:FG`H0F4@\g#SVKGq>DK1tr^@
Nk-tJZ_jll/D/gg!smNk?'\<8T.%bseGaI>oia@dAXf#A2'k[O4d[%@]ATnFr_R=7Aoac!pn`
b\!q_3,<Cbb9HeYc26e,.`YMoiB,777(D`7haZT%Y8W++,$<go<r09bbX"iC'a`40K!R=obN
qXG`]A/N`ccQ'aq/=XA;b9jQ(tY?IkZ6IpRJ:T3DWb?=qhcL[4b"CBq*A1IeZ[;E<kA,%c?P^
LRqG3*gdhn,PHHc50g#cDmeT!V</LN`lMCDLF,s60YoVP8^C%87G@RX&?BeKnUm>-umgER6Z
p6.RS&E,>%K#42`UH3us3f..!OuMq1-/e&,;`W)8X2+ob0ik7.5gR2`%6#1m`H&o_fP>O&ln
_@8cWrTr.TA4\s']A2$f0Df\Rj`5pl$ZF(t>,L:AIs9]AKp%5k-hfS`^_2snqGdjY%g/bMTU^L
4f2WBG`VH!?'4_J8s0-eSVLZcl'KdF+eK"(,BAOt<@btP<P2fqjuG@Nm#_s+q*"?!EbZiOG+
YeGj$6P-qM1n$>9e5pcMG&i;V))FAFS-U_!'NKaDLPG=c(&2cF$s[er/jX9MMfhg@E\a!+)W
M/ck4Zb.*+^kBmE)>EO?6`Fe@.E)W)l$^7:ZJZ3rc@6"6mRPcL>;]AVSLX9oPG2S>Zja04*Ao
imjDpp[PpK!RLo4tTk\Hf!hiQ2lj78)Gh2*D@jJoDEEI/_:5dm2nVs8"0Eh>j2QI$)Rr[&f!
hKF?;OlI!bsURBl6o4>#-ej>S\XV7;0#Z/)mW#+.5!r1Z>ZNE_'=37<;DE.;:FV3d3^I%U:p
=&[/%Osur-o:<\A:LAMpSUGr4;<s9CBOD`"H3H((;([`bX8cC6$V'Jk)WVm_L&#dihu\]A/HT
7$G&OG4<X8-(%N4C\,,#%3Ea*,XpqDlo>BHJr]Ak\[bc>(!*gNPF=:O"&+9[VQ30QE;4L's&V
mGoC3r&)#u(6[c-I(aHEQPPl^9-@-8O/)j2@"V9[qp+Ka;9H5W]AT>u1o>-+AF`TL^KJO`#UM
eqL5k<d>JKdDW>2Uhc(]AA.,t)`If<anR!0J0]A2"BEeX_#9>+?9G8V]AF(XcC_fB)[a.2iaTR8
0BX[U>9E]AL;idU'4o(]A14QqrtM&S7[cEg,@7^[i[?50k686ZE@jcHG>=;09*Hh@dC4EP8aQU
YNA4AF77hZBA_fjkW(N8I#:41ieBP#[UukI[A;UG0#o==lsGGf[U*o*2NGm#2'+1gFrVtRFZ
eunA0ua3]A\=U=AB_E;Knf>UDq\cXfO]AUM+.4sl7Blc3lA'P*81AXUr^;Z#"lp`+.eGu92]A7`
1#F3<l_:S2r#euhk(Xcga#]AS]A4@0PE8Q@jbOGAZR]A48>c$rI9o6Yd72KbjE]A#cl^j5=0J3t=
t54Sn&>tXJpWI*&M:0[s8?.nSnT'U<iauirI4~
]]></IM>
</FRImage>
</Background>
<Alpha alpha="1.0"/>
</Border>
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="2">
<FRImage fm="png">
<IM>
<![CDATA[m<IeQ*74C;Om"ZY&knAuU:2OZe<$WH.+)h[M)&8AM'+'I7'ro?LT&US&V?sVNR!4)b96YK0l
QKns2=fnpYkI]Af!EZUHgQ7,HM6%<HQrW03bhE)&eYhgB0)L$,UB2Ps7VG:jSs%<kT<D0P'b?
t1tBCX3W$?d7c9]AC"+A46b_^aC:FT8Ng<M-[3K$."4mtCh"IA.V)ANEJ;cCsol,as(#iGOYn
:R3RS%BT25rl%PrJY>YSAMJ;]APOXS<uiGA4/O#5kH?pu7e`CMQTMKCY_d8C$O,a_*HUiqc]A$
u,FaKdEo.N]A_;Gfi[qMaf.:F>UphK'd*5J2t%3dLts3tA>djF//`BY=Y;rK\c\&XWr,GI9DL
[,3*05UlChKmu!J4;6jr]A21H0^".mQ(*#JH$c(;oK09mS98k+QM&)/\Us]A%D4'oRp:I7:Zot
[Wp/T[#9_e_(%e>T]AelQf-Y"27QLj5N8[j-,Y6i6LA/Y#Y>DGb!fpZfXo(N\lcoRP+&rgF)d
>h44->n%8Km/1uS[_Wb5i`KK4f,k_jr*RB'MEVQADL]A"eEjasdk.luk,#laHAn[KWM?]A%j.[
//M&@"GnEOa85C)?P-Xj7OrcO?`1Af?%Ys.4gp8l?3up83b$BA?+B?a+%"&d!Qafm_5l,f;7
/EE$-)jj;AB?a/"(V0.>>>Y6:h3*4Yg[#hO&qcAcX^o#&,dg^E7CI$?IW`iQ<0de='T?0CSS
/nHc>mr$:k@_PDp2d9J1i"(*0f:>uj,#kG'YP=\[OuK8&^U(s?l.B+]Ai4'+kO[l(1:J)]A\28
Fa;_"Z7*N#9S:hr\j7;774*Q&f.lV:jJh2rZCf<L7o/.p'^@XGU)]A_QqD4+65H*0,R$Y-ao6
.b]Al5meHNp#@Qh\E$mKV0^6.9^6r4625@lXi/T!3;eLL2Q\K(d/JA18Himnpla'4$PMYnK@e
CqA/;_1[#NY5-:B$aD_8uN3U8s[R:MeYnQc)QbnG@/$joY&@Ko!MIjRo5>iXq>.`%j-#'J+l
`=^+*PD>p\Z[O&PO)83,3Was/WZ'^38P\tElu!=L:4m)8/=GGU@LQ<AEXTj9F,A>Q9WfbfY3
d6j2kJ8\GPlN:>hhCADnhD>P+9:-OV\0'RXOU;'=5rqsnB=0SQ`O4IK`RQ"H$#bgYU$Lc*7&
7UOGu/_<'Fa*d)priJai)BW-I<7&gt3^DTaaXV%Acq$eX[k%f=dEu0G.QlI[S>el]AbH/l]Ad7
FoQJ(t_VuH+=Na#)]Ap5:6Y_t-;WGgT3@77JX/u_PJ0:T+I%e=CmhY*K2kj%mCk@Z-N9rI?iU
i)`dQe'k/!ot:J*toG9?KNbc*WWLG]A:urq-Bc"E^F+<=89m$tPc!'&lO2Gb$Dr;/0B'1e/bo
f2aJ;j^^eA8+KR-F&<fqX'!pX,#=5SUu0hT.aUuE0AKf./O9_H]A,!l,bp+[OTQ>NLdY]A(UtB
hjK/WB?*2O9oTq/4R?OH?ofL^$f8E;-h:Gp,@(?^K+AW]AJ&T<oGt?*&p"923V/$RU+;;qD-e
R'-7l62d+k1Jb^./=_+SMfL*:Qgb?gqi?/ha7\rn84g`rc#[+N+cXD^=m%D1%++@Jp!Yh$4k
-+2Zio<!V=X3AP08[TeQTN#`8a37&mK95X2^n&1GX[7r2l("1[p5N\NI6kZN&OOs?O`EkJoq
=]Ao,[J]AltS(a9Wa;W_84%_GU%_0l7=Gg(d?/`#Iq!5tu5P@cHG9>MLRE?&u(B?44\MYFuf4V
r.@@f%A^b6b`S5o5TU&(_'"'PXep6!PG3^*FIq9l#oq$(<6a&(cX`t0Hjh#1]AOcMMkI0k!K'
]A08A"m?e?@M!mGG>+!I4%Ot8`6h?<jLX43&0q(Mo\Nk!sZ[fqO:+90K>"4&]A>?@:t3]AX1MlC
C>gn&MpTU9c6<]A-T+^_g#,\G4C[ERb`ZbN+SH%QslBV,/kb\I,H?Ig,n-5HR3-$jbi@H9EVT
FPMH2H58of>!8^:Z*D5CA^DR?g:'LmV*ocilO/"XJOE^:Q%`jmR0pfYJnXJl9fe6ErXf]Ai?.
MVS;[F;<eO`a;),?$l2]A=,C,[UtWclW6$8=pb"/!F(#Qn_qI?=7QY]AGTWkfPXZa$r=.PYQr,
2Hf&,(F,N'u557YK('!-=0!QR#!LU[;F;$*<=8`3p:7C'&b4WO?MPHrY1%&4LT&:aQTqQMRO
FCp88)%iGJ$RR>M.1X<lKPl4//r72VF$KsDbP\==(aRuE-1.H%M=_j?D"L1\nA:\S,@Zhh7X
JcscE)/lMU9Bgr#?mk7SZO/:3<&2>Y939=jODk4uUZm8B>6W=3,8+1FKr1A5YM+;]A_9C2^!Q
J`/!6rZ[1&<h(l#7AY<%jSIFLr8^j/ulXDmmD^p(sH_'G^*s)ZNH*RCW7Mi.nbN)p,FYVZ&b
@LZ9,<;U['oUfSJ#gK[1gHSD3G23!T(cH@OhBr=AB.;\Kp#llU6sSLRW$MT/CO#&?gWlV#FC
GL5WD.nX*oLKf@G+7q8J"#m'[P?YKu1&gK3pGYIfhjL/XbgHY:Ng/2\1pp5qNY'slqi4ZU$;
44(`56pcGJi=N[c^FQh("EuOb(Mk%J]At(ZqhYhdqU<AsGcFc<3ZO6;Fn+.g5_(bYK8rDY$_(
88?,BQANT_%pBGQ:fZ8iQWIJdj$D:Po`@-"ZqqNDTP#+?j"ns3UOHKj0^i:i%1$D\ofD'A;a
r0>q^mmn796+/)]As]A&L+a[ddtc1FS'Bj@pKq?\q:B[/FpKFRd<r?4rD`SqeXIO)NI0OF//o,
pR]AqGX=Tao&qfC/loqM.$fN3394D>TCP8"EA,e[J^,?FpE#WlPiV>0lWoeV4J7ao;1aIS<q/
EJ+o-W$OT*jiC)71J!W2o5rs/T("XhePlm!aM.bfN<?Z4^nT_0;X?o+jLl+kD2S=#m1r&Q7%
nl"K=Z?L-p!sU)>es'kf=V1C@4)2PkjLV;0n#7_?>NY&#hce-qN+5cg#=.rs+KQZpF#cN?"u
O4e,msr^Xhb]A%3/NIgD0]A_o\CL%Q15lkD(Zs+`.Or[4c(t[L=8+R;CuMW:HQSO;,0r2ACg0[
8rZM+b(D,ik_e%$FI^Q`-rT'?1H#,giY8WG%R_(YlS;14Z&>5h;Jc\/)lpct_UB7NLP=)4lU
lethLR!(,GG,r)b-JTRkhP6h;r;#[A+"aXmCVM-+s>G^Aq9Z^^ntj2dZ3ptg8K3;*K&3UmAn
'1\9^Bj\,76*>Y%:3gq`%c"ad(+,hu4G#=F2'KV6TU+euK:TslINKNuD64TFRAVET5V>D:1W
5n-Jn8dMd;0&KX(#K_L6Gp!O[Cp*lnYAp<,LY\LhGOKZiJI7sPDalJ%\/b#G^]A+#j!MRe_Ml
5Y-^bGod*\`0?4pcCu^:+P7j#OO?`.e[O+_*]A!OX=YJa)WX;*j\K]A&$_c?8lCt7AVYS(rtPm
Q"H_1f?Yrt_>cU/_LL$sZ#BZV=$+lmQ1Y5Db?k.G!#e[M^`t-eg_7@aK8oKupb,d?5qs!p)n
_o8rY7UbrI$DmHl7]A8Gbrn65\dU6jWB?Z\D`_t5=npr)`=B1e3M.$$]A.9J'[__$K-n"/cUXd
>sG@&TI+c#EF_%aeI6SV(9Ro?)-*TOnR@Yr((537D/GBAa>_cP2n2F/)VIfZD4)fg#=7hl*s
?Ag>N7MB$-7+,ogXa2-#7!kab!`(U+3CG.o(7Y@\o>,l;J*nUWp9/]A6/g8:&&&G_g%B^S]A+N
uSo"PH6ro-JLnb;d5*e1,:`WM^[HU\6S:D+Db>pa_,Jqu0?gWHJ":'X4-8mL^J5o))ko)M.\
Lb!9K4(?hnhF7g0QV<2@GQT$E,]A9bQA>f9f$!)AbBs)b8H&"N0k8XW&%%!0]AJ?rJ0NaXhMj$
:?BgB+A0Y.;0/C=p=*4/mZ\0HWO>^H,S6o$5QFRQ\!QA5:e(]A=V)gJ1SQtL_7o:B6:)9XFp8
/Zl(9uV8R.TBi?Kfm<ALms#tJ7IfQ//#&_c&"<,UH\b.C-1gZ[A)jKOSVU_?u!8AFCuTBTh'
/0T;ZV]ABW]AbE,!eM2PNK*^Hg8pB"mQSEng%/;QH[1lBqnW2E:pT5E?QcA&)=cLs/[W]A1aL<g
DQtA2WrAZY>SO8Q#WJ5d2Hl'8.O-K+uA@NQ<bV$:QL5(n`>b`9k1PWr[$TkI.Ii%%ZV-9)TQ
d5Z6j8dkc9De:KBCHS1pfpMIKpDE#m_FYM?2e(6ga"QmE/Pq@(pfNB;Zgnj:SV42V'q&qYJL
Ve')-LEZ.<4^3lm:=)lm@:=2;O/@U`bd'BJr9@,6,&Vo<oXCm8pMh\^1`#RfJ';p>#nhf`lk
\*-1Aru]A%q4#+j[Y8[7Bd*EBCW7j:j!VD;4E#liFn)6Hg#q(#u<C4H2-)Dr-:b$E\$U;FklW
Th$#F"W7#4,>rd`O^)HYellFFf!<4ID?Bd2DQWd\8pu+RXYO)TeTnLWK*pT;q$[;$'bNd9%R
P^4^kDWS?\7>6QQ'2n*EU>X?'!,ZhRaEPY4Ke=ooiErqG_[:BVK+qgq0d4)#GJj?0"%6=+V@
i8AgI#lRYhC1H2He=YSB+T8)6#Zt=$>IaK)/8'uIMQ3kMickJPh%LQ]A*l2[@5U6b0F`?OkRC
O_7H<lHP:c$"W1B`IV@7r!3qB\=2a\m)ZuSu^>(>ADifYk!M*VUaHd`a@6CE'p_['U)WLHu/
D8[2.huZt+fIk'`MsHQej]A>Ri*VZgnd,K^du0"To,*T*QtG#L&goF.Yj.LZW28qc]A#dG]A&`=
a?<9N1hcA6l=D-R'VWMWDJGP_BUKbY8c&,GShp-TqE'utB7R^GN4sL8o3kr999`)J6HCb2<,
sfocpjl/Btfp>$m!/N-HU-^T5;Z#EWtUN6B_Cr]A?8bN1+Gua&TRUr2"lGp+B]AI\[(XM&<LiO
6Hn/V-:T1=]A5=XrbcN6"hmFmnk8;+dmTq0.qkQn]A<r^CAi;9oCr(U:djA6En3-.^Z3KMAiqH
#iQ>-YtcW[Sbh9c(_G[r$f1M'k;NhX=?3KKZlYYI=7]Aa61M"J?b^5kJ,;Tu%>Ua<XUnULS2R
Hm@I6atJ(""-!hbSkh06Z*cF*fQ]A1T9A8J&!'o"'nsKD%O\c_"#5kl.n'A9,^b6^?%`l4IA^
39E&n^(\pT;4/_T>N17uZ"X8DGKLF4F=Is!Ma,,t[86MQ;X2R+a0XVj<I4]A2,$S1:("p@GgL
&tg"#g_8<.#E9h7^>AIR0/`:[GPK%Km6+k&.@]AnnT3nGk[+>D_2[Fa2h8a2V#\4;(*'*c[f1
bYmQfTJ<u)%eX()!4[/[M(Gdr98c&A>9,8H>WJ-Suo]A\gYBX2$%#lW2c,j[/F>E()*Pu(/BQ
.SCmBHZ0@<f3\DVb9f'g>i$W^Vg1V_osZ^,ROZ<gc>3[=(Keg#s,![GH4"c(Wtmfr?3&>pQ"
NTD4Xj/AuX0h2VO[4PZh6KLQn6o"cLdnA`A2'IV@V\9F\7%oB@eJrRV'Z=!`2G*:Q+/Gb1/H
eC)"<+.a*WdSY36-BV^AS#2mna>LQ?J^b.MA%F7LKhj`/W=EB00H=Hlhq&"p_jjpbjfQ4`qu
!76i_6SE4JDEE0hQ,jaXHt+cSdSK]A8>Go3j2>qgT'8Ff^(BQq#2Bpo0'Up'$6;\MM?;Q+3B'
\."Ff!qBK=598m0fC:73r"a98J@mW=L$FcmZNa\>_]A`'_[*cUH#9KVmM2T*<$qieHM@rq;$:
GQV?Pu.__r@?jnk2FRr\F%$lpfjUO0tI<unX8&K2(5TK-)[TRfrpjlFS!^Gbb1#iC;=:^h9j
g?kI:I&bY>d3N2VjijM\Dko_#j!)?d*h"6ssuQ-R7c'U(Y'5lhL'nI'fud2\5ugJ'(tA=;=<
Ttc9M>W-KSd`p,^Jn-UCm(s!rM2EfhZ,qIfkGNTgH)HaX%PR5b*Z`kP[N,pjF-:-^jeHI;kF
ITT\+j4C2J''&X?oht-Og+(K-+tRHZ;W9CnaoMe'/S!T"-j]A5Ad=EmTIReAXn'obbu0QB]A=d
::c%bMO#<l_[`LG,_(@22c@7uWV,$W"/t="?F^:Bum"+J,f<fs&&VT<Nn5VaiE_mo3<p1&'%
2&Mi\0"G*0lhG<c#%>0oP3@ar6*938G79<,g^@e7<`sq[]AJ0f2:p=\PO8$IpKX:rp4*^G=(p
bDPZ:3ZQ'IX$e%F=5OumMaORo$OnXUDFLS*-VGTSE0g/9CjcVS`Ve'1l1MS10p>]AXepciqLn
F(<"p>Xp[:[-oCWXtkLJEb9G/Cir2&O;WEK,'s[mI9nmh,Y5SM>A?j.&@$SfF,P^)";`@q)N
=3DHp^M85P?2".Z(c/CL^/-=Q7%\nn7j_@mXG+[!hbJ55Tgc>VP'!Ia8,GFljK'jH(aj2DFj
d0b'NubTRnmZ;qN<,<JANm\H$i+-#J/b!Uld_fG>2%c<.hj:'k=p$=Y-Ccfn3[C9pnfh89Tk
lATsUS<Ub_K,Yo69T$07cEBYS\JNZfOJWG)K/Sfi+=(@D4\DoH/33O)Ie'UEI"!BTeN]Aq'`2
\K*NTr+.-'26I($er!HKa%ME/tM;4@k2;t`ZLb^/:[[%S?!6usf3DS5mZjcj;W:5#_af@fBL
Hpl:EYI\B='p76OdU-?c`j>X/S8%b3f:77;)+LCD]ASeWi7F96q0tf/.$NIcQEDEr!+nb*B6/
/oVP9K(ApJ^kRGa'BU>`GGgFN(khI\ce=K+N.GD7Ou*@^'PN/@VNnn/n&B8+&2WbG,`<If,8
)D5RECkOmFd`ASIIal#uJf3LHApid\0)BmK2ZH[GE3Hk5*#2$0^l+ARTpn8d!X.h2,3"Pi49
o-O#FT.+n\;L.uNof[hQ0`C&OY!S<Q))7#D3,nS9+>),FP^'#ZY#0P<hVNfV9ES`"+*VNMDE
Ljr'\Nq\0fiU>p>pZ<b*%:m%Gud>E%)W/AWU#YYTiPW@sKc7oM?fW]ABRrhtDI3B1CKYnV/4D
^t#0&KIHYIL0@gE:[DKd2Cr9!;lSYaN,1;98%k-,R/)hSfOgA"fKlisOkj4*,@31%2_Kj3kU
p7m,j)[G6X6NLp1b)mG-IO&$<K(i\-8u5@5D?N-Mh#^JE'mKhD:(ulVV;CN=:\YiinE9)K;%
Z2?Fm1>$'jg^XDZIeu`<;]A&;pY!$E?)A4L5:2*4;,=5XEP[,jI:-MZ<j+CkOcgCI=H=&k>VK
YMQCUg7mWb\H&4)g'1T')So?;UY2H/0E]A2`]AEJ3.rd);E&VT+XWKP25]A9VEB8t-k+EgggQW&
&"c\k<@8MXV1/VQ^;9-%iOe2@>i`5sW]A:lc!B"OZ'K88uNo[p>-o$2(;/PAS*h4dDL?NGNK7
Xj<aViJ>sT<Upm[U_@[gDA!;F^QPN=e<*O.@ABG^mr:LbC0^38``N/<2==p]Ap:TIreL0cjjG
D53TO=j#%.\jO_\(WJl7-_Z`V]A;m#tgfZ>M-Uj4-U<`hF/9eTCqjHWEt]A'0_@t\0d#_lI<MC
p7E7;=R7Pa,iH5Uqi\sTZ>.?\2iG;l59KF.J,2q7qEDl;>@@q0KI43rt9aA>Lj_k*0Nc/51^
L.Qc;5)&QZK_,,kaVB*ds#+@)FPGIr1=2'-pBW(5&r\%il[,Vc=e*n`1dfI.`fNRo*FiZ=^X
[l$d(P)PK/`JV_?=cn(?9oYbDbk/=uJ==!.D1*"DcAW'io4c/C"(p>/B,Jk"Du#-M`Eg=V)J
@VN<b;00A3BNcIG:u!SSo=N]Aj8;g`L_fgRTib[\8%7Fft(%?Rb'&P7nl1#,pao-$kSN?N%L3
q/4?O#E\)*5F,2(=r\^Mrp'r^lMeNu!Xe!scc(CE(>X[!e#ocA==5rY)ANnD*\caX:DpcX8q
no^pZ'*KL/6^(]A8[/p'[_WR&[HnKk[-B0#lj&VI`1e%I!@N0S:qP`uR[3pT!IqHY'u1cJ[%k
%0'h0(hA$2T>;&Y#spSQg<t6S7_=TE^&!8/.Lm`S/&8#,IMf*k',0gPsn6Ini,3f'.,?uCNd
k?4Y14orO]A+mWU;m_X]A'Q)Im9UWJ^%ea?0dNpe'o653_`s/0%7Qn:J=.:,)+jF(CuOlNNJ8W
r@d>Eg:f#s$:@8j(i4Yf#`Gg9>hI=L>W0pJ=kV(G9f&`W2)=AC9\JDkU0m/%`3^9a[kojp[e
V_6"uJ)gi?+(c^qEoX$9$qa#3N?/"nX\`?%g2G-%iD8`ifUL?MIPk_csq4i50Ha&Jr.R9<#@
SbBm9@eX<-sfLN2iUZgunO(,;Y%5YkQhPetkTRA!V/Wpu\Y6H)q+P.UkD^RRC=0hbia#:rO(
u1P%qG$aEpJ)%inQIWo)*;6B[qcSX-jPZ3HprG)GLeVbm7T:FG`H0F4@\g#SVKGq>DK1tr^@
Nk-tJZ_jll/D/gg!smNk?'\<8T.%bseGaI>oia@dAXf#A2'k[O4d[%@]ATnFr_R=7Aoac!pn`
b\!q_3,<Cbb9HeYc26e,.`YMoiB,777(D`7haZT%Y8W++,$<go<r09bbX"iC'a`40K!R=obN
qXG`]A/N`ccQ'aq/=XA;b9jQ(tY?IkZ6IpRJ:T3DWb?=qhcL[4b"CBq*A1IeZ[;E<kA,%c?P^
LRqG3*gdhn,PHHc50g#cDmeT!V</LN`lMCDLF,s60YoVP8^C%87G@RX&?BeKnUm>-umgER6Z
p6.RS&E,>%K#42`UH3us3f..!OuMq1-/e&,;`W)8X2+ob0ik7.5gR2`%6#1m`H&o_fP>O&ln
_@8cWrTr.TA4\s']A2$f0Df\Rj`5pl$ZF(t>,L:AIs9]AKp%5k-hfS`^_2snqGdjY%g/bMTU^L
4f2WBG`VH!?'4_J8s0-eSVLZcl'KdF+eK"(,BAOt<@btP<P2fqjuG@Nm#_s+q*"?!EbZiOG+
YeGj$6P-qM1n$>9e5pcMG&i;V))FAFS-U_!'NKaDLPG=c(&2cF$s[er/jX9MMfhg@E\a!+)W
M/ck4Zb.*+^kBmE)>EO?6`Fe@.E)W)l$^7:ZJZ3rc@6"6mRPcL>;]AVSLX9oPG2S>Zja04*Ao
imjDpp[PpK!RLo4tTk\Hf!hiQ2lj78)Gh2*D@jJoDEEI/_:5dm2nVs8"0Eh>j2QI$)Rr[&f!
hKF?;OlI!bsURBl6o4>#-ej>S\XV7;0#Z/)mW#+.5!r1Z>ZNE_'=37<;DE.;:FV3d3^I%U:p
=&[/%Osur-o:<\A:LAMpSUGr4;<s9CBOD`"H3H((;([`bX8cC6$V'Jk)WVm_L&#dihu\]A/HT
7$G&OG4<X8-(%N4C\,,#%3Ea*,XpqDlo>BHJr]Ak\[bc>(!*gNPF=:O"&+9[VQ30QE;4L's&V
mGoC3r&)#u(6[c-I(aHEQPPl^9-@-8O/)j2@"V9[qp+Ka;9H5W]AT>u1o>-+AF`TL^KJO`#UM
eqL5k<d>JKdDW>2Uhc(]AA.,t)`If<anR!0J0]A2"BEeX_#9>+?9G8V]AF(XcC_fB)[a.2iaTR8
0BX[U>9E]AL;idU'4o(]A14QqrtM&S7[cEg,@7^[i[?50k686ZE@jcHG>=;09*Hh@dC4EP8aQU
YNA4AF77hZBA_fjkW(N8I#:41ieBP#[UukI[A;UG0#o==lsGGf[U*o*2NGm#2'+1gFrVtRFZ
eunA0ua3]A\=U=AB_E;Knf>UDq\cXfO]AUM+.4sl7Blc3lA'P*81AXUr^;Z#"lp`+.eGu92]A7`
1#F3<l_:S2r#euhk(Xcga#]AS]A4@0PE8Q@jbOGAZR]A48>c$rI9o6Yd72KbjE]A#cl^j5=0J3t=
t54Sn&>tXJpWI*&M:0[s8?.nSnT'U<iauirI4~
]]></IM>
</FRImage>
</Background>
<FormElementCase>
<ReportPageAttr>
<HR F="1" T="3"/>
<FR/>
<HC/>
<FC/>
<UPFCR COLUMN="false" ROW="true"/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[288000,1008000,144000,1008000,720000,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[288000,4381500,1600200,3009900,3009900,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="1" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="1" cs="4" s="1">
<O>
<![CDATA[立项明细]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="3" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="3" s="2">
<O>
<![CDATA[项目名称]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="2" r="3" s="2">
<O>
<![CDATA[数量]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="3" r="3" s="2">
<O>
<![CDATA[预计合同额]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="4" r="3" s="2">
<O>
<![CDATA[实际合同额]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="4" s="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="4" s="3">
<O t="DSColumn">
<Attributes dsName="Embedded7" columnName="分类"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="2" r="4" s="3">
<O t="DSColumn">
<Attributes dsName="Embedded7" columnName="项目数"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="3" r="4" s="3">
<O t="DSColumn">
<Attributes dsName="Embedded7" columnName="预计合同金额"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="4" r="4" s="3">
<O t="DSColumn">
<Attributes dsName="Embedded7" columnName="实际合同金额"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList>
<Style imageLayout="1">
<FRFont name="微软雅黑" style="0" size="72"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="2" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="104" foreground="-526345"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="80" foreground="-16713985"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="48" foreground="-526345"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m90fqP@rItp(sVNA>\`N/W6U!?Yu(IWY!aW/aCi_J>:RCCXcP7#!sS#+CpULM(PL467"m%MQ
*A$@tYBp7#?d>P:-\K8;K!`cPQpS6:/carP<A(I$qapN&,O8Icnd4KK&Y>pO2INT6oJal]Aj2
SoU+SpA'1#b*\0EZ\n]ABP(QhXn]A\rB#2s5*Iig%_:;cYGQZ1RuZkEZW.re1$&b@(q)M\2rfF
d4:^>&2"2:Q36SX,#9.Hh6b#]A_R?28KK\`r"JV$52#Vj``8AWSVJ:t+>4\b:seLY3ICK)#V\
R0[hl/YOG;+G)9iXISX,dZ7'5_M-rdRGRZgjG*uA8.Jc54K#)M.@gURB4-E!KO.6`hrnr@jc
+jGBq-U&9-o&EYhZV>QsB]A/Sl[J@Q:+@gi`+mR`c62gMtBC,m+_cq;aLs,0!EmI:#M/iZ;lt
k/IT:W6c557NS5[PTNVJJbV#P9pHXQ\q]Ar:J2fD/%Y^_9^BX78bg8@@VI+V854hZ21UQFN_[
Y:`iJ^j4Z8QdP0Bdc.cC>h4EXWd&_!Xo]A;\26(*TZ>]Ah55bS^18l05j/0g!9BLNTRfZK8g\=
.)!uj#B>^%j"MDeJXXpgKrPZL7%njnJYH.XS2B`YEPh&ME1eCKEK(\j2%gDRI/%kh^'6OT\9
ejC,V-#!Q-1A-ZmqT1&6fQ^%-o1)rgq`Y2kqR$P^;-K/m;[c<6AfEnV&EEp!L4`e1h>Fk*Nc
pVftl._N'pC(S@8_iRBDj<p->=j:`qnud1?%PKj]AfXEsKEtc(<:GA<a;1Rc]Aj-jaeQ019enL
RpW9b_A3)roK48%iWDo>7jnJD8&r%D9MgZ?A:B8>Jk?",]Ar\<Be/e&Mk8I5Jp4X+3F?h_tKn
OmGi>5*>bhcU\<Yj2B%A8X>iD=W]AF%seQlk'>?%AQ-Q`f]A>E72j8ZsdDiT;+TOrYAQX+IYG0
$`Z?rWr]A"$A4aQd9)u_Dm?b:H]A/UF>pbE\p;(sujo,:?0*e"A-9G_bmGF:J0>iafs35h<g"-
FrRMB\<MYM'Y[W\qL7fR\5=Y%#*PK(XnU*Khg,nbd\ODkiDI!!9g)q3BF&uR?XDGhHG!iUOV
%>2+#^"7"<!`,XgA)rVrM%%lr?Z2i(6g_oqZVeH^+DEi*V/MZckfE2=ikA2r@2sd%'^%@i-8
dZAc>'>)1_"QYf]Am5tkIIDfX+ADpBhEKPo^R@(r_-X-5cO@1K&Z+#!VGlqb\4h(0/DkcGNGH
(6%tq+WYk[-d00'no,otFj^ctmp1S=q=aDC^fDt(F]Aq*uk*qf7'Dr4,LGZq[/D,"bias2p!O
8@C]An;^N#5W.B6T(%20=+XiEYm:/&NeGNp&[hEqpQqC3\p).B2i9iL9k;Aao<L5AhN/Qs>7_
?K3[Q`frSh-iSOs"<mH.@gh9H)t@l_ibj!?!<%ua4m.=6I@cI2am#MWl8"hrn#QF2XbRBU=(
*8NALgdVNk)&Y$1;UK0^86%X)AtVQlZF:>OREAtq38-*g"EfH-^^WJ7<\8.jIl$DjdtHpV'8
]A"q+&Bl_-$j,#jpp;)!aBeb_%rgW<LsI+bM\D*:A>GYQu/iV1@5B.cV(@=lR)sF(?DmI[4Zj
rS2u^?FKE]AF:Y7#"WCpo]A#lHC]A.in>\8E\?,;CpUDmaORaO-X%68+'/G^OOUI5No?)JERF<,
5K9ToFul0"uler#"5sW"Nh[O%I:c07UYuhJi"Y4of+VAh9Y@`%WV'^Ff6SuEP8U61L]AKL)F[
(K(hF/4/B;UZ3cbiS.R/&>UU'SKlKX#Bmr,HO.ZM>EU5?IYG:PX,]A>'i>fE:P9U454P?RoQi
p"MA/44Iu1TAYRu)eK/]Ae%_-1RpKf7L#1n"HZt,f9:K+'.aFX.+f0!hL_D$bVW4jp#b7PH`G
!L635`?B7sa_C4;5/[R?;s_L<f,]A+oOu37LH<W?o*%'V)\UurG4'Wa8hY-8VHlg]A.pkl'!Y_
eku0uQ%aoOOOQ&/3)+]A7l^kt!VSt\5B`LG(Y_a#W5>3J]A8e>'6sMHtJMbj=B/;+'E/L4cjBM
kc\"Bmc`B*O^UNJ3n.R3g>L@eR-"W<3]ARlDM[n!XIP,h&&\pgcZ"UdnHj7W2T0PJ@RF^;D2Q
.B,059X3IF'E9I'fXQga\R#HO,'.\(K558fe+0Dp3''dsY5(p$:(n%*T'e6-FbFOu7?"Xm`j
7O[O<MQ`NZWkJI_Fm[iI'>[uGjHoMSOOD!tSa_sb]AN<(b...[j8Z&g(!.uYg&"U,[$5QM:4H
LPZ/f!A^`guO0?P_"tiCkqOA`7(@RnElP_^Nk]AMIh&UMkdl;L$b,9-'OcEHQ_9=A$r_8LXl0
Wb$0IO+m&QhCY,l;[@M-EG1K-IP7Je,Ap)>m-\I.hi*DE,LG-X_9b`8O([-V_Pd=`F8T"EoK
/l^K:-bM^P=N]Ag-hGRhSl/Fo)Y/Lc<UDNLG@n"%NI`2,f,Rl_.!pY+jb'R<;4V^)_F]A?V;o^
Y*i%dh6=?VK6';mdM?MM[bOj0G.-_$=(dE94oOo4Q[Z#Jk/s)3e_lDpn4bTeB]AD,5bhbXnrp
gdI)tS1o&1Jn]A!UZ5#9SfZ61#f_c6AR?7D(X"I/'HSU8F6a=B#(9=i"A:]Abp8iCNpO1$'*Wj
)V0(rQ.kk\`:6YXA'F+V`bh/>EZsE]AW5#VCE<a%iU>AgbHr+DWI3j9(/*MlHT7%5a=3HSEdW
!7;\'l2O,O#P=aCahL_m_R3K@I$TM*j#(i"Sa`A8cM]A>GJNAS$HQI^G3R#0k;pon\.V4N6SF
#4.t:j%&f4G(=0;@m<J$GWT7:]A.^\q&1aQouQ4'X2eb@U*bN)6TYQAFX?NOI^)q)pI5kA2f3
HQDn.mG+)R3Ze4%U%&kT&1q<O2igY1CYqS?34b.*EOX?7kGWtKLpD\LXEF>(X'#pLV'bmC`r
aQ$!u<Ht/=hrkYojs\,r"N_/hUi,m-KsSEi1`;\4nM)<jjSH_6m0&FUfs6.HQtn+uFsN>SZc
qqsTq]A,m$Z1:0IAEl$)bA'r*Ob3%:7VmKlCYF!S,&sQHQrMIjm5S$]An]A?<Z=n[`C'UTKfPig
:InOFN.&\_6<Jjrj\'44Wh#FUO&__"!+quufWRa.SIu?[Yj>;Uu$-jhU]A]AZ@p-R6p7d^GOdY
)ns`VZ/?uOfQVaO0qTumF)L2De(7'_X6o/`bL!M=N;seL;6t/>e":M&r<X]A3.M\!;3lN<KB.
k4LE\2KTenFOZ">QK1#!oU@S9@l9!_SQg8pEm[4c4dD=6nqUi"P2FBhc]ALPh.ckdtRR730"b
$>n!e+^i'+(rHA2M+$F9l3g@#gnU"WnJ<5rQe\kI+!Wb=A,(k2YOtt[o$+0h_JI8C7/6Wq2t
fmeUf+m+,o(0=]Al*:W[E(a@3Bm/7iq#P5dC0Tf,i[&XU%I6L@g\X:[e5/Z>WGhf53o<nJXR7
b]At#13)56C&:RYFc]APnGLF'!68:ig5o_eTa8,MD6D*s[]A-Np`i/oqnQ'//3n+I$Eri<464Tr
VCT)dHm$*C&5?iIWd7XJEpVdFZ^'u/YG+-hae<9H]AhLUotBdShuYiZ5"+6aY^UY0GsG+&XB'
tmn^bB"s&4qP;qaO:=Wg<*$pDBtjG--T]AiGM[`e#1#HJr?6'Y30^3O8_II7e64Ul@AYpcAVL
e&I(sP>)g*(N&7Renb@co>?@!p0*)_0^$lFD"`C)QdqC8#`G8-Ih&P0<,`WfU@kg?J@n#/cd
C>4enE/HCQuKAZ1;"_;W5fp7gSOL2g&.T/[]A]ASRa("%6uCGu8pgK)`'[FU.G%6R;CnBQ@h8J
i8H?+ulq3NW1-=8-Pp9/K?HSat:O<>]AIM`Hl6?1UXK7D(F`lk/WGa-Y62E7f:m&ra\]A',uS9
eXR?>F$_F06I<bBHT3s"^D"%i7k/g9C8&$ViA?j2t.aDh$jhV_C8Uk1f`%^f3$g%)X39!rS#
&ApB8LKKs>N]AY>cEEJCnII*kNog)*ICBV1HCFWk0p?Xt84RrKS=r^hHa_@I`9KD$-3Gcs6Qb
e@Xi>ZZWL^EV7+?@t='=3mTI!Ikph)PNc7NW@*k)J]A3qoOmi#1is+XPT,(IFZ0?s*$hP0O09
\Of7F(?cJGq+.Nuhp$G%g(ihV0sdMXgk`n#;*>pJ/Tj\<hm.,8S1C<$:o$r^u20>=r5c$Hi5
LiTq=G+8V#sL),7h'_F<!S(7mi:aK/_0HsP4jF?9/15'QtJp4e5JQ9J(.5KN&:RZ+<,FU*(/
M!+SM5mE=Pe+C_EKK%d"l22t)]Ag0uP]AN.)-FrMLOP<)I3ii@B5?)6*Yu>C,b*dOO(6Mg;%-a
qrH*aD,*bru/!H8MKn&Nem_)qF`<oGb>>+d(u?]A3PVA=^FI+<`5(N2GP7Wk3]AY@"!rd?(<iO
S1C:pcIEj2lZs@0$uSk:f3A3&X%hDs#4JCr4e.9NnkD4>F$B"erF>d4NpjkA%Q35/lrB3;T<
ipWCEtoA+%!*9$5\0d?o#$M+4g>W5AH"ACN]Au=95reDri*`o-$#3up!.YLK*L+)@cO&P(*3X
-pJ^Br:0LFd+."0s#*gNNcOpf%Z?N$j;I0rc1n4Ga1"mF<)]AsR32fd->*RgG^@H!D%9j*_QA
jsfcs2t>h+uP[(koUS0U"Qd59s\ZEiA"WoR[k;fFBZY4C&h6D'Z9L2&d0W^=bj\c[V1KIk:c
u0#b#6+8$h(]Ae>WJL-boeSSNup^I.e,bZ*F[8Q_":illfF,>T,=UqVfR7n=Ze&q?]AZK3-Yh*
QFE>5<#t9n=k"i&=u-'Bc"dj@*+=DBe89&-B:%3>Pr5ZecSd6nl:VPJ%ieUYYu"ECohs./)1
MnWG+MQIa[4-!H!olPX:j7'cSS1ICu[mU"E(7m!qIWa_Y[m?eG@poC%C#R]Al+[_L'm?M./gm
aGCo52ba++fm&Y`H92YOd(A"o?;l*Ml%@hIPNus\,6CH'h8?\b$9lqlsgAris3X"Sq%P9DTg
a6^?>8?hioSu0Rkt;`5_?mYp>E)goU?;nBn<e`!04Z-L)-M6HJac)u_rJu^@ZFia^`'2Ufmj
?!6.=7P/8Bg#o>Rr+<2.Oh6LHSOPkdJ8b["ApP1c+3JO/AG6Z"-:N-kkM[>APO!b9q#D5U3^
cc6;D[Rm`seO]AJl12U:$bQ:o&LY5#a:b92;&V)%`:#5Xl5(0*+8u47UA#')h5Jg+:U4LhVMH
LJMigiV)s7HiW_PkfRkQ1)%9[m04o6k5Yo`TK1TF5frBhSSW$Jor-C6)IbI5I67f[bJq4PY?
NVs/&hn>Ia"ZIe$9L2+[;Vl<q,<D+T]A'0(r@YuIi]AV,6FbR9$;\6NL#K`Z&h+1PJ&OqM@UC9
n'k8\s2pn*Y(9I".=A5MKsTW+iH%^Q9LbFa/l>,l8OSd\&L(C)5FIA)jH?VWAO;bjN:*t9pN
.VN&[-G!p*1mdX>LC_n9S-2>sPm0-YLo;>W5?1mM?Wk\'G13O%hUkQ1iifMTI9?HnI@Z\Vqk
%tQCXIbYlpfFquDrVl)<nnk`sO2Iotk_VS'C##GYXSIl3bT7mUB<A9k0Kt=e4G9SWPSa$r\S
)m=Bp"p[Y,i/CMS;r3^R%AECK2._J:;n4^'RHtdsF6J#TlW`.pg8cm]AS`TLUA13Zq!rq71[M
,m%6[0"1Q11S#*c8C"2=2c45(Yk,S8o0`Cn*J^E!MGE6!:9sTG#!IajTY'egb*4/GCbffV2/
u`)ma9>K<doiULF=R/:)0;V&bT#Ho<smY6PepR`lE]A:^cYNAtnD5W"V<R`8ETICW+2]AG,&l>
QuJ&S-pTcK-4[pB,Ndme2H$a?Bc]Ao!UNFo:Vr?0PV`F48!IN$><V=B2!kp4bYB$!EFTmDsOh
JH0&iUi3)hJVaj6nigVTT$9s4D#UY=`bk.+ac3q=$b&rqm$14M`\3V^[^3N,Guacfi*)\J=C
<A[,S'-3U"V[/0B>QmDtJ3V"PJhLs4Ra@$7':"J#)r#;(,YPT=MCb@*:;?1KtP.bQCJK;jYt
"B(tLm!QV-i1=d5M-K#YDWoh<E9QS_#?;s<Ipl+tTL[*<R^gZMlHhaEUoDmo$2QIZh"7N9&Z
nR80D2&L&*Fih5g6\CH)A`+pa&P0H/Gp%cm2."d3X%5KD9oUML-^o/e$9Rtki7[]AFYUI4!8:
u*jBh9nL(l=rp/Pmb\KcAJqb70Z$JJpaF>h<Y-q;DEGVmAp6!8&`Mb7ri6Y96)T<@rtm^SRF
&0'AdYq#2[9cKY)X<E6beDQj]A*]A<b&hPO;HLeU).1]AKNs:_P)8M'>q,@e(]AqrC"./L?U+=W6
)r1e^R<)68<6Gh6PagmETR6rn7el<uhX"puo4qB$XOBGgl$Z183.:HUbmThPQ-V)JN7fFH@+
[jF2:D*#F*45IH1'mD!-$TWF!A0CoU$Ku'Sa';P8#a5b[gs)j4lf`<7?!XQb+04t=B4o+)fZ
9N,2'F2=]A$Sm??=Ji/OK8S5EH&iXGjLN@+k>-`eh_Q4V5o]AZ?Ql38IbKh$(8I-;^<p4Y&\rS
56/_^@g>N+!$%0`3+WGR_ci2J7hRq:bhGa%T:27_"(0]AK+SX2YJE"@'R(m;gCNB:p6E@T4W[
s1(5e-WA+tY7L,_^&9/q-77fbreb>F-YA4+MBUS+]A;%:h<s5)fjY8'!hc:ttU!UA[>d@;<Zf
L"+p1>$cqkn?rj:i$U!L'-^>3ro;3s6&[5B_(n'(X;'?/3BKYPsK9rl3=taYQ8`<'qd_psCb
foE*Bki7@Tj*Xa]A"=*o6dTp=cEjPQS7nE0Keb3lcelc[ZA;6$;N:&PT!0@5H$qO0]A:;h*J_L
7`3MJ?6>HoW5&q0S:fR=Vr5nKNJ%<(KWq*SCb>u=p+hn>en$lUaIpHn)We!JmnFuW:QYk>S2
kVC_NFr,kG-]AZtTR>d+0j048mp\+!4X<#tJfp.!%#!h@GC=3IUD;"]A$A(Ssf<A*9s;SoOUMl
l"@)^lFKCBcO.WbTicHp(3PR?dH.*3LK+%o/5/<1&f\D"&<`]AK8/,9V+Xq(h_]A)HnN!L$*Vq
E\BPb<2lZ"XB[_;FWr06-Sm&W]A929[+*kS,JjH>gpc?Hdl>&3DKiA=BJ`c[BP]A;J^/>=7'',
W7#%i=e`o(k?4Pgk/Y=utY1OFR6i!8\R2KAoWm5"8h\AKh:/'37n4ZB[5I2]Ad7H%;sXK]A-dR
WlJkkaa_S*q5*k;(D+PS:VN-Kk>R3bZp*'e?s6MFH'^A!?)apDR/ZZ)&G03Aer+8.X2kX:UZ
O81VBJ+6G'>-A@[rnWqnQ<U)"<3_o">o.d<:Yoc63B@@YX"=#EufCP*sh2+ep.j.T9c!/cl!
SQ\pBJS6E2RPMl;kUn9%pq_XTf/&W\Mp44`Zlp.3EETV&m^_i^42QW3CJnBnE`$-Y`H`b&kY
4?%5B\dKU]AR!.Es6Yqo*u133qM#64=AdVI`\Dtq;"FEBp/2+o*4@7hnV@d!GDJDmS$Ws70!r
4h3B_:Q_%!drc=uD0',Fdjp%Esm\1:?iU>K+9P5]A0#tE'_4p64Ii5.U=%&%E/dYMTIoJ(aY'
H740I4Z8--ILb6c<b"]A1GjG+pPfh9:\.]ATM(F8\0`9IjA>X>/>c<Qg5^p"ATj#0Knuppt'N=
q!1SD#!.S=#mCX2O0<G5L,qr+Qgb+-rgh=]AUY^'HG:3.gVrD1NaNGi;;/:!bSW/pl\!(oF&2
$7Ua+HG&QC]AF`]A[_:Y$.7TtU#DZ+5]AESV0Eg:tB5((jm"[.UshKuS>X&(b]Ac?-URQ.\,V?Me
r'4)C_"d/8*O.]Au[/#6G1p4(,IW5NO67C0Q?%4<Z*h-)@",g,/2nKh)SWeYUfmWG1#FF/pr+
2lf&Us&VqSoZXe,4Yg>ONC:7'=DRqocF!1N-j_7\>\I3G]A,]A]A3@Fj]AA-4"b_O;--!m1c4VVd
Mso"8OikkJ48OdEZc+B"B+ND/M=td!;ZSFdcU]AEB]A)[Yk\9HDFS,qm\0sREM\(^kZiS%kI?:
9Q"rr<oR!>0XmrJ#2GZR/P&FH%%i??P]A]A*Y.#Co6JM\Abt.X0%n;Y76p;c`'faSi]AO=XM)rb
nrI1TUbA+<FE%n=@c(b>VGMUlmb<B4Vhh3lftJ>dId&IqJloVs[rj[[V5Udro>,'FKb2LB+D
#L';A:@'n6M;]A2%fBg_jYs)kCr)O&nl4rIX":tY:CL+$*3Re=CU3CbO7bgNM]ADZ]A^7>/ceJV
&r#h521]AYK4=f4t.At@UDhq_"P^S%#7.c7TL>1<3;qEdqd6f_<[mFHS"YK?(1UbeUO5C^HHi
JNn*(]A8c$j!$m=%([&eQJbrM1oEuO1dFsqEL3kr11.T?o35kkU$cM%e#(A3$?n5XF8!e6<eh
%j+nBCc<;?&&m(]A,qN2E8Gkn//a6]Ak,A8Ur.QD"bj;k6$uVb:"K";KU!4nOiW9.F*DnQGkDW
q-`$Frs&~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="250" height="150"/>
</Widget>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[723900,723900,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList/>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList/>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="652" y="352" width="203" height="168"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="report4_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report4_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="宋体" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="2">
<FRImage fm="png">
<IM>
<![CDATA[m<IeQ*74C;Om"ZY&knAuU:2OZe<$WH.+)h[M)&8AM'+'I7'ro?LT&US&V?sVNR!4)b96YK0l
QKns2=fnpYkI]Af!EZUHgQ7,HM6%<HQrW03bhE)&eYhgB0)L$,UB2Ps7VG:jSs%<kT<D0P'b?
t1tBCX3W$?d7c9]AC"+A46b_^aC:FT8Ng<M-[3K$."4mtCh"IA.V)ANEJ;cCsol,as(#iGOYn
:R3RS%BT25rl%PrJY>YSAMJ;]APOXS<uiGA4/O#5kH?pu7e`CMQTMKCY_d8C$O,a_*HUiqc]A$
u,FaKdEo.N]A_;Gfi[qMaf.:F>UphK'd*5J2t%3dLts3tA>djF//`BY=Y;rK\c\&XWr,GI9DL
[,3*05UlChKmu!J4;6jr]A21H0^".mQ(*#JH$c(;oK09mS98k+QM&)/\Us]A%D4'oRp:I7:Zot
[Wp/T[#9_e_(%e>T]AelQf-Y"27QLj5N8[j-,Y6i6LA/Y#Y>DGb!fpZfXo(N\lcoRP+&rgF)d
>h44->n%8Km/1uS[_Wb5i`KK4f,k_jr*RB'MEVQADL]A"eEjasdk.luk,#laHAn[KWM?]A%j.[
//M&@"GnEOa85C)?P-Xj7OrcO?`1Af?%Ys.4gp8l?3up83b$BA?+B?a+%"&d!Qafm_5l,f;7
/EE$-)jj;AB?a/"(V0.>>>Y6:h3*4Yg[#hO&qcAcX^o#&,dg^E7CI$?IW`iQ<0de='T?0CSS
/nHc>mr$:k@_PDp2d9J1i"(*0f:>uj,#kG'YP=\[OuK8&^U(s?l.B+]Ai4'+kO[l(1:J)]A\28
Fa;_"Z7*N#9S:hr\j7;774*Q&f.lV:jJh2rZCf<L7o/.p'^@XGU)]A_QqD4+65H*0,R$Y-ao6
.b]Al5meHNp#@Qh\E$mKV0^6.9^6r4625@lXi/T!3;eLL2Q\K(d/JA18Himnpla'4$PMYnK@e
CqA/;_1[#NY5-:B$aD_8uN3U8s[R:MeYnQc)QbnG@/$joY&@Ko!MIjRo5>iXq>.`%j-#'J+l
`=^+*PD>p\Z[O&PO)83,3Was/WZ'^38P\tElu!=L:4m)8/=GGU@LQ<AEXTj9F,A>Q9WfbfY3
d6j2kJ8\GPlN:>hhCADnhD>P+9:-OV\0'RXOU;'=5rqsnB=0SQ`O4IK`RQ"H$#bgYU$Lc*7&
7UOGu/_<'Fa*d)priJai)BW-I<7&gt3^DTaaXV%Acq$eX[k%f=dEu0G.QlI[S>el]AbH/l]Ad7
FoQJ(t_VuH+=Na#)]Ap5:6Y_t-;WGgT3@77JX/u_PJ0:T+I%e=CmhY*K2kj%mCk@Z-N9rI?iU
i)`dQe'k/!ot:J*toG9?KNbc*WWLG]A:urq-Bc"E^F+<=89m$tPc!'&lO2Gb$Dr;/0B'1e/bo
f2aJ;j^^eA8+KR-F&<fqX'!pX,#=5SUu0hT.aUuE0AKf./O9_H]A,!l,bp+[OTQ>NLdY]A(UtB
hjK/WB?*2O9oTq/4R?OH?ofL^$f8E;-h:Gp,@(?^K+AW]AJ&T<oGt?*&p"923V/$RU+;;qD-e
R'-7l62d+k1Jb^./=_+SMfL*:Qgb?gqi?/ha7\rn84g`rc#[+N+cXD^=m%D1%++@Jp!Yh$4k
-+2Zio<!V=X3AP08[TeQTN#`8a37&mK95X2^n&1GX[7r2l("1[p5N\NI6kZN&OOs?O`EkJoq
=]Ao,[J]AltS(a9Wa;W_84%_GU%_0l7=Gg(d?/`#Iq!5tu5P@cHG9>MLRE?&u(B?44\MYFuf4V
r.@@f%A^b6b`S5o5TU&(_'"'PXep6!PG3^*FIq9l#oq$(<6a&(cX`t0Hjh#1]AOcMMkI0k!K'
]A08A"m?e?@M!mGG>+!I4%Ot8`6h?<jLX43&0q(Mo\Nk!sZ[fqO:+90K>"4&]A>?@:t3]AX1MlC
C>gn&MpTU9c6<]A-T+^_g#,\G4C[ERb`ZbN+SH%QslBV,/kb\I,H?Ig,n-5HR3-$jbi@H9EVT
FPMH2H58of>!8^:Z*D5CA^DR?g:'LmV*ocilO/"XJOE^:Q%`jmR0pfYJnXJl9fe6ErXf]Ai?.
MVS;[F;<eO`a;),?$l2]A=,C,[UtWclW6$8=pb"/!F(#Qn_qI?=7QY]AGTWkfPXZa$r=.PYQr,
2Hf&,(F,N'u557YK('!-=0!QR#!LU[;F;$*<=8`3p:7C'&b4WO?MPHrY1%&4LT&:aQTqQMRO
FCp88)%iGJ$RR>M.1X<lKPl4//r72VF$KsDbP\==(aRuE-1.H%M=_j?D"L1\nA:\S,@Zhh7X
JcscE)/lMU9Bgr#?mk7SZO/:3<&2>Y939=jODk4uUZm8B>6W=3,8+1FKr1A5YM+;]A_9C2^!Q
J`/!6rZ[1&<h(l#7AY<%jSIFLr8^j/ulXDmmD^p(sH_'G^*s)ZNH*RCW7Mi.nbN)p,FYVZ&b
@LZ9,<;U['oUfSJ#gK[1gHSD3G23!T(cH@OhBr=AB.;\Kp#llU6sSLRW$MT/CO#&?gWlV#FC
GL5WD.nX*oLKf@G+7q8J"#m'[P?YKu1&gK3pGYIfhjL/XbgHY:Ng/2\1pp5qNY'slqi4ZU$;
44(`56pcGJi=N[c^FQh("EuOb(Mk%J]At(ZqhYhdqU<AsGcFc<3ZO6;Fn+.g5_(bYK8rDY$_(
88?,BQANT_%pBGQ:fZ8iQWIJdj$D:Po`@-"ZqqNDTP#+?j"ns3UOHKj0^i:i%1$D\ofD'A;a
r0>q^mmn796+/)]As]A&L+a[ddtc1FS'Bj@pKq?\q:B[/FpKFRd<r?4rD`SqeXIO)NI0OF//o,
pR]AqGX=Tao&qfC/loqM.$fN3394D>TCP8"EA,e[J^,?FpE#WlPiV>0lWoeV4J7ao;1aIS<q/
EJ+o-W$OT*jiC)71J!W2o5rs/T("XhePlm!aM.bfN<?Z4^nT_0;X?o+jLl+kD2S=#m1r&Q7%
nl"K=Z?L-p!sU)>es'kf=V1C@4)2PkjLV;0n#7_?>NY&#hce-qN+5cg#=.rs+KQZpF#cN?"u
O4e,msr^Xhb]A%3/NIgD0]A_o\CL%Q15lkD(Zs+`.Or[4c(t[L=8+R;CuMW:HQSO;,0r2ACg0[
8rZM+b(D,ik_e%$FI^Q`-rT'?1H#,giY8WG%R_(YlS;14Z&>5h;Jc\/)lpct_UB7NLP=)4lU
lethLR!(,GG,r)b-JTRkhP6h;r;#[A+"aXmCVM-+s>G^Aq9Z^^ntj2dZ3ptg8K3;*K&3UmAn
'1\9^Bj\,76*>Y%:3gq`%c"ad(+,hu4G#=F2'KV6TU+euK:TslINKNuD64TFRAVET5V>D:1W
5n-Jn8dMd;0&KX(#K_L6Gp!O[Cp*lnYAp<,LY\LhGOKZiJI7sPDalJ%\/b#G^]A+#j!MRe_Ml
5Y-^bGod*\`0?4pcCu^:+P7j#OO?`.e[O+_*]A!OX=YJa)WX;*j\K]A&$_c?8lCt7AVYS(rtPm
Q"H_1f?Yrt_>cU/_LL$sZ#BZV=$+lmQ1Y5Db?k.G!#e[M^`t-eg_7@aK8oKupb,d?5qs!p)n
_o8rY7UbrI$DmHl7]A8Gbrn65\dU6jWB?Z\D`_t5=npr)`=B1e3M.$$]A.9J'[__$K-n"/cUXd
>sG@&TI+c#EF_%aeI6SV(9Ro?)-*TOnR@Yr((537D/GBAa>_cP2n2F/)VIfZD4)fg#=7hl*s
?Ag>N7MB$-7+,ogXa2-#7!kab!`(U+3CG.o(7Y@\o>,l;J*nUWp9/]A6/g8:&&&G_g%B^S]A+N
uSo"PH6ro-JLnb;d5*e1,:`WM^[HU\6S:D+Db>pa_,Jqu0?gWHJ":'X4-8mL^J5o))ko)M.\
Lb!9K4(?hnhF7g0QV<2@GQT$E,]A9bQA>f9f$!)AbBs)b8H&"N0k8XW&%%!0]AJ?rJ0NaXhMj$
:?BgB+A0Y.;0/C=p=*4/mZ\0HWO>^H,S6o$5QFRQ\!QA5:e(]A=V)gJ1SQtL_7o:B6:)9XFp8
/Zl(9uV8R.TBi?Kfm<ALms#tJ7IfQ//#&_c&"<,UH\b.C-1gZ[A)jKOSVU_?u!8AFCuTBTh'
/0T;ZV]ABW]AbE,!eM2PNK*^Hg8pB"mQSEng%/;QH[1lBqnW2E:pT5E?QcA&)=cLs/[W]A1aL<g
DQtA2WrAZY>SO8Q#WJ5d2Hl'8.O-K+uA@NQ<bV$:QL5(n`>b`9k1PWr[$TkI.Ii%%ZV-9)TQ
d5Z6j8dkc9De:KBCHS1pfpMIKpDE#m_FYM?2e(6ga"QmE/Pq@(pfNB;Zgnj:SV42V'q&qYJL
Ve')-LEZ.<4^3lm:=)lm@:=2;O/@U`bd'BJr9@,6,&Vo<oXCm8pMh\^1`#RfJ';p>#nhf`lk
\*-1Aru]A%q4#+j[Y8[7Bd*EBCW7j:j!VD;4E#liFn)6Hg#q(#u<C4H2-)Dr-:b$E\$U;FklW
Th$#F"W7#4,>rd`O^)HYellFFf!<4ID?Bd2DQWd\8pu+RXYO)TeTnLWK*pT;q$[;$'bNd9%R
P^4^kDWS?\7>6QQ'2n*EU>X?'!,ZhRaEPY4Ke=ooiErqG_[:BVK+qgq0d4)#GJj?0"%6=+V@
i8AgI#lRYhC1H2He=YSB+T8)6#Zt=$>IaK)/8'uIMQ3kMickJPh%LQ]A*l2[@5U6b0F`?OkRC
O_7H<lHP:c$"W1B`IV@7r!3qB\=2a\m)ZuSu^>(>ADifYk!M*VUaHd`a@6CE'p_['U)WLHu/
D8[2.huZt+fIk'`MsHQej]A>Ri*VZgnd,K^du0"To,*T*QtG#L&goF.Yj.LZW28qc]A#dG]A&`=
a?<9N1hcA6l=D-R'VWMWDJGP_BUKbY8c&,GShp-TqE'utB7R^GN4sL8o3kr999`)J6HCb2<,
sfocpjl/Btfp>$m!/N-HU-^T5;Z#EWtUN6B_Cr]A?8bN1+Gua&TRUr2"lGp+B]AI\[(XM&<LiO
6Hn/V-:T1=]A5=XrbcN6"hmFmnk8;+dmTq0.qkQn]A<r^CAi;9oCr(U:djA6En3-.^Z3KMAiqH
#iQ>-YtcW[Sbh9c(_G[r$f1M'k;NhX=?3KKZlYYI=7]Aa61M"J?b^5kJ,;Tu%>Ua<XUnULS2R
Hm@I6atJ(""-!hbSkh06Z*cF*fQ]A1T9A8J&!'o"'nsKD%O\c_"#5kl.n'A9,^b6^?%`l4IA^
39E&n^(\pT;4/_T>N17uZ"X8DGKLF4F=Is!Ma,,t[86MQ;X2R+a0XVj<I4]A2,$S1:("p@GgL
&tg"#g_8<.#E9h7^>AIR0/`:[GPK%Km6+k&.@]AnnT3nGk[+>D_2[Fa2h8a2V#\4;(*'*c[f1
bYmQfTJ<u)%eX()!4[/[M(Gdr98c&A>9,8H>WJ-Suo]A\gYBX2$%#lW2c,j[/F>E()*Pu(/BQ
.SCmBHZ0@<f3\DVb9f'g>i$W^Vg1V_osZ^,ROZ<gc>3[=(Keg#s,![GH4"c(Wtmfr?3&>pQ"
NTD4Xj/AuX0h2VO[4PZh6KLQn6o"cLdnA`A2'IV@V\9F\7%oB@eJrRV'Z=!`2G*:Q+/Gb1/H
eC)"<+.a*WdSY36-BV^AS#2mna>LQ?J^b.MA%F7LKhj`/W=EB00H=Hlhq&"p_jjpbjfQ4`qu
!76i_6SE4JDEE0hQ,jaXHt+cSdSK]A8>Go3j2>qgT'8Ff^(BQq#2Bpo0'Up'$6;\MM?;Q+3B'
\."Ff!qBK=598m0fC:73r"a98J@mW=L$FcmZNa\>_]A`'_[*cUH#9KVmM2T*<$qieHM@rq;$:
GQV?Pu.__r@?jnk2FRr\F%$lpfjUO0tI<unX8&K2(5TK-)[TRfrpjlFS!^Gbb1#iC;=:^h9j
g?kI:I&bY>d3N2VjijM\Dko_#j!)?d*h"6ssuQ-R7c'U(Y'5lhL'nI'fud2\5ugJ'(tA=;=<
Ttc9M>W-KSd`p,^Jn-UCm(s!rM2EfhZ,qIfkGNTgH)HaX%PR5b*Z`kP[N,pjF-:-^jeHI;kF
ITT\+j4C2J''&X?oht-Og+(K-+tRHZ;W9CnaoMe'/S!T"-j]A5Ad=EmTIReAXn'obbu0QB]A=d
::c%bMO#<l_[`LG,_(@22c@7uWV,$W"/t="?F^:Bum"+J,f<fs&&VT<Nn5VaiE_mo3<p1&'%
2&Mi\0"G*0lhG<c#%>0oP3@ar6*938G79<,g^@e7<`sq[]AJ0f2:p=\PO8$IpKX:rp4*^G=(p
bDPZ:3ZQ'IX$e%F=5OumMaORo$OnXUDFLS*-VGTSE0g/9CjcVS`Ve'1l1MS10p>]AXepciqLn
F(<"p>Xp[:[-oCWXtkLJEb9G/Cir2&O;WEK,'s[mI9nmh,Y5SM>A?j.&@$SfF,P^)";`@q)N
=3DHp^M85P?2".Z(c/CL^/-=Q7%\nn7j_@mXG+[!hbJ55Tgc>VP'!Ia8,GFljK'jH(aj2DFj
d0b'NubTRnmZ;qN<,<JANm\H$i+-#J/b!Uld_fG>2%c<.hj:'k=p$=Y-Ccfn3[C9pnfh89Tk
lATsUS<Ub_K,Yo69T$07cEBYS\JNZfOJWG)K/Sfi+=(@D4\DoH/33O)Ie'UEI"!BTeN]Aq'`2
\K*NTr+.-'26I($er!HKa%ME/tM;4@k2;t`ZLb^/:[[%S?!6usf3DS5mZjcj;W:5#_af@fBL
Hpl:EYI\B='p76OdU-?c`j>X/S8%b3f:77;)+LCD]ASeWi7F96q0tf/.$NIcQEDEr!+nb*B6/
/oVP9K(ApJ^kRGa'BU>`GGgFN(khI\ce=K+N.GD7Ou*@^'PN/@VNnn/n&B8+&2WbG,`<If,8
)D5RECkOmFd`ASIIal#uJf3LHApid\0)BmK2ZH[GE3Hk5*#2$0^l+ARTpn8d!X.h2,3"Pi49
o-O#FT.+n\;L.uNof[hQ0`C&OY!S<Q))7#D3,nS9+>),FP^'#ZY#0P<hVNfV9ES`"+*VNMDE
Ljr'\Nq\0fiU>p>pZ<b*%:m%Gud>E%)W/AWU#YYTiPW@sKc7oM?fW]ABRrhtDI3B1CKYnV/4D
^t#0&KIHYIL0@gE:[DKd2Cr9!;lSYaN,1;98%k-,R/)hSfOgA"fKlisOkj4*,@31%2_Kj3kU
p7m,j)[G6X6NLp1b)mG-IO&$<K(i\-8u5@5D?N-Mh#^JE'mKhD:(ulVV;CN=:\YiinE9)K;%
Z2?Fm1>$'jg^XDZIeu`<;]A&;pY!$E?)A4L5:2*4;,=5XEP[,jI:-MZ<j+CkOcgCI=H=&k>VK
YMQCUg7mWb\H&4)g'1T')So?;UY2H/0E]A2`]AEJ3.rd);E&VT+XWKP25]A9VEB8t-k+EgggQW&
&"c\k<@8MXV1/VQ^;9-%iOe2@>i`5sW]A:lc!B"OZ'K88uNo[p>-o$2(;/PAS*h4dDL?NGNK7
Xj<aViJ>sT<Upm[U_@[gDA!;F^QPN=e<*O.@ABG^mr:LbC0^38``N/<2==p]Ap:TIreL0cjjG
D53TO=j#%.\jO_\(WJl7-_Z`V]A;m#tgfZ>M-Uj4-U<`hF/9eTCqjHWEt]A'0_@t\0d#_lI<MC
p7E7;=R7Pa,iH5Uqi\sTZ>.?\2iG;l59KF.J,2q7qEDl;>@@q0KI43rt9aA>Lj_k*0Nc/51^
L.Qc;5)&QZK_,,kaVB*ds#+@)FPGIr1=2'-pBW(5&r\%il[,Vc=e*n`1dfI.`fNRo*FiZ=^X
[l$d(P)PK/`JV_?=cn(?9oYbDbk/=uJ==!.D1*"DcAW'io4c/C"(p>/B,Jk"Du#-M`Eg=V)J
@VN<b;00A3BNcIG:u!SSo=N]Aj8;g`L_fgRTib[\8%7Fft(%?Rb'&P7nl1#,pao-$kSN?N%L3
q/4?O#E\)*5F,2(=r\^Mrp'r^lMeNu!Xe!scc(CE(>X[!e#ocA==5rY)ANnD*\caX:DpcX8q
no^pZ'*KL/6^(]A8[/p'[_WR&[HnKk[-B0#lj&VI`1e%I!@N0S:qP`uR[3pT!IqHY'u1cJ[%k
%0'h0(hA$2T>;&Y#spSQg<t6S7_=TE^&!8/.Lm`S/&8#,IMf*k',0gPsn6Ini,3f'.,?uCNd
k?4Y14orO]A+mWU;m_X]A'Q)Im9UWJ^%ea?0dNpe'o653_`s/0%7Qn:J=.:,)+jF(CuOlNNJ8W
r@d>Eg:f#s$:@8j(i4Yf#`Gg9>hI=L>W0pJ=kV(G9f&`W2)=AC9\JDkU0m/%`3^9a[kojp[e
V_6"uJ)gi?+(c^qEoX$9$qa#3N?/"nX\`?%g2G-%iD8`ifUL?MIPk_csq4i50Ha&Jr.R9<#@
SbBm9@eX<-sfLN2iUZgunO(,;Y%5YkQhPetkTRA!V/Wpu\Y6H)q+P.UkD^RRC=0hbia#:rO(
u1P%qG$aEpJ)%inQIWo)*;6B[qcSX-jPZ3HprG)GLeVbm7T:FG`H0F4@\g#SVKGq>DK1tr^@
Nk-tJZ_jll/D/gg!smNk?'\<8T.%bseGaI>oia@dAXf#A2'k[O4d[%@]ATnFr_R=7Aoac!pn`
b\!q_3,<Cbb9HeYc26e,.`YMoiB,777(D`7haZT%Y8W++,$<go<r09bbX"iC'a`40K!R=obN
qXG`]A/N`ccQ'aq/=XA;b9jQ(tY?IkZ6IpRJ:T3DWb?=qhcL[4b"CBq*A1IeZ[;E<kA,%c?P^
LRqG3*gdhn,PHHc50g#cDmeT!V</LN`lMCDLF,s60YoVP8^C%87G@RX&?BeKnUm>-umgER6Z
p6.RS&E,>%K#42`UH3us3f..!OuMq1-/e&,;`W)8X2+ob0ik7.5gR2`%6#1m`H&o_fP>O&ln
_@8cWrTr.TA4\s']A2$f0Df\Rj`5pl$ZF(t>,L:AIs9]AKp%5k-hfS`^_2snqGdjY%g/bMTU^L
4f2WBG`VH!?'4_J8s0-eSVLZcl'KdF+eK"(,BAOt<@btP<P2fqjuG@Nm#_s+q*"?!EbZiOG+
YeGj$6P-qM1n$>9e5pcMG&i;V))FAFS-U_!'NKaDLPG=c(&2cF$s[er/jX9MMfhg@E\a!+)W
M/ck4Zb.*+^kBmE)>EO?6`Fe@.E)W)l$^7:ZJZ3rc@6"6mRPcL>;]AVSLX9oPG2S>Zja04*Ao
imjDpp[PpK!RLo4tTk\Hf!hiQ2lj78)Gh2*D@jJoDEEI/_:5dm2nVs8"0Eh>j2QI$)Rr[&f!
hKF?;OlI!bsURBl6o4>#-ej>S\XV7;0#Z/)mW#+.5!r1Z>ZNE_'=37<;DE.;:FV3d3^I%U:p
=&[/%Osur-o:<\A:LAMpSUGr4;<s9CBOD`"H3H((;([`bX8cC6$V'Jk)WVm_L&#dihu\]A/HT
7$G&OG4<X8-(%N4C\,,#%3Ea*,XpqDlo>BHJr]Ak\[bc>(!*gNPF=:O"&+9[VQ30QE;4L's&V
mGoC3r&)#u(6[c-I(aHEQPPl^9-@-8O/)j2@"V9[qp+Ka;9H5W]AT>u1o>-+AF`TL^KJO`#UM
eqL5k<d>JKdDW>2Uhc(]AA.,t)`If<anR!0J0]A2"BEeX_#9>+?9G8V]AF(XcC_fB)[a.2iaTR8
0BX[U>9E]AL;idU'4o(]A14QqrtM&S7[cEg,@7^[i[?50k686ZE@jcHG>=;09*Hh@dC4EP8aQU
YNA4AF77hZBA_fjkW(N8I#:41ieBP#[UukI[A;UG0#o==lsGGf[U*o*2NGm#2'+1gFrVtRFZ
eunA0ua3]A\=U=AB_E;Knf>UDq\cXfO]AUM+.4sl7Blc3lA'P*81AXUr^;Z#"lp`+.eGu92]A7`
1#F3<l_:S2r#euhk(Xcga#]AS]A4@0PE8Q@jbOGAZR]A48>c$rI9o6Yd72KbjE]A#cl^j5=0J3t=
t54Sn&>tXJpWI*&M:0[s8?.nSnT'U<iauirI4~
]]></IM>
</FRImage>
</Background>
<Alpha alpha="1.0"/>
</Border>
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="2">
<FRImage fm="png">
<IM>
<![CDATA[m<IeQ*74C;Om"ZY&knAuU:2OZe<$WH.+)h[M)&8AM'+'I7'ro?LT&US&V?sVNR!4)b96YK0l
QKns2=fnpYkI]Af!EZUHgQ7,HM6%<HQrW03bhE)&eYhgB0)L$,UB2Ps7VG:jSs%<kT<D0P'b?
t1tBCX3W$?d7c9]AC"+A46b_^aC:FT8Ng<M-[3K$."4mtCh"IA.V)ANEJ;cCsol,as(#iGOYn
:R3RS%BT25rl%PrJY>YSAMJ;]APOXS<uiGA4/O#5kH?pu7e`CMQTMKCY_d8C$O,a_*HUiqc]A$
u,FaKdEo.N]A_;Gfi[qMaf.:F>UphK'd*5J2t%3dLts3tA>djF//`BY=Y;rK\c\&XWr,GI9DL
[,3*05UlChKmu!J4;6jr]A21H0^".mQ(*#JH$c(;oK09mS98k+QM&)/\Us]A%D4'oRp:I7:Zot
[Wp/T[#9_e_(%e>T]AelQf-Y"27QLj5N8[j-,Y6i6LA/Y#Y>DGb!fpZfXo(N\lcoRP+&rgF)d
>h44->n%8Km/1uS[_Wb5i`KK4f,k_jr*RB'MEVQADL]A"eEjasdk.luk,#laHAn[KWM?]A%j.[
//M&@"GnEOa85C)?P-Xj7OrcO?`1Af?%Ys.4gp8l?3up83b$BA?+B?a+%"&d!Qafm_5l,f;7
/EE$-)jj;AB?a/"(V0.>>>Y6:h3*4Yg[#hO&qcAcX^o#&,dg^E7CI$?IW`iQ<0de='T?0CSS
/nHc>mr$:k@_PDp2d9J1i"(*0f:>uj,#kG'YP=\[OuK8&^U(s?l.B+]Ai4'+kO[l(1:J)]A\28
Fa;_"Z7*N#9S:hr\j7;774*Q&f.lV:jJh2rZCf<L7o/.p'^@XGU)]A_QqD4+65H*0,R$Y-ao6
.b]Al5meHNp#@Qh\E$mKV0^6.9^6r4625@lXi/T!3;eLL2Q\K(d/JA18Himnpla'4$PMYnK@e
CqA/;_1[#NY5-:B$aD_8uN3U8s[R:MeYnQc)QbnG@/$joY&@Ko!MIjRo5>iXq>.`%j-#'J+l
`=^+*PD>p\Z[O&PO)83,3Was/WZ'^38P\tElu!=L:4m)8/=GGU@LQ<AEXTj9F,A>Q9WfbfY3
d6j2kJ8\GPlN:>hhCADnhD>P+9:-OV\0'RXOU;'=5rqsnB=0SQ`O4IK`RQ"H$#bgYU$Lc*7&
7UOGu/_<'Fa*d)priJai)BW-I<7&gt3^DTaaXV%Acq$eX[k%f=dEu0G.QlI[S>el]AbH/l]Ad7
FoQJ(t_VuH+=Na#)]Ap5:6Y_t-;WGgT3@77JX/u_PJ0:T+I%e=CmhY*K2kj%mCk@Z-N9rI?iU
i)`dQe'k/!ot:J*toG9?KNbc*WWLG]A:urq-Bc"E^F+<=89m$tPc!'&lO2Gb$Dr;/0B'1e/bo
f2aJ;j^^eA8+KR-F&<fqX'!pX,#=5SUu0hT.aUuE0AKf./O9_H]A,!l,bp+[OTQ>NLdY]A(UtB
hjK/WB?*2O9oTq/4R?OH?ofL^$f8E;-h:Gp,@(?^K+AW]AJ&T<oGt?*&p"923V/$RU+;;qD-e
R'-7l62d+k1Jb^./=_+SMfL*:Qgb?gqi?/ha7\rn84g`rc#[+N+cXD^=m%D1%++@Jp!Yh$4k
-+2Zio<!V=X3AP08[TeQTN#`8a37&mK95X2^n&1GX[7r2l("1[p5N\NI6kZN&OOs?O`EkJoq
=]Ao,[J]AltS(a9Wa;W_84%_GU%_0l7=Gg(d?/`#Iq!5tu5P@cHG9>MLRE?&u(B?44\MYFuf4V
r.@@f%A^b6b`S5o5TU&(_'"'PXep6!PG3^*FIq9l#oq$(<6a&(cX`t0Hjh#1]AOcMMkI0k!K'
]A08A"m?e?@M!mGG>+!I4%Ot8`6h?<jLX43&0q(Mo\Nk!sZ[fqO:+90K>"4&]A>?@:t3]AX1MlC
C>gn&MpTU9c6<]A-T+^_g#,\G4C[ERb`ZbN+SH%QslBV,/kb\I,H?Ig,n-5HR3-$jbi@H9EVT
FPMH2H58of>!8^:Z*D5CA^DR?g:'LmV*ocilO/"XJOE^:Q%`jmR0pfYJnXJl9fe6ErXf]Ai?.
MVS;[F;<eO`a;),?$l2]A=,C,[UtWclW6$8=pb"/!F(#Qn_qI?=7QY]AGTWkfPXZa$r=.PYQr,
2Hf&,(F,N'u557YK('!-=0!QR#!LU[;F;$*<=8`3p:7C'&b4WO?MPHrY1%&4LT&:aQTqQMRO
FCp88)%iGJ$RR>M.1X<lKPl4//r72VF$KsDbP\==(aRuE-1.H%M=_j?D"L1\nA:\S,@Zhh7X
JcscE)/lMU9Bgr#?mk7SZO/:3<&2>Y939=jODk4uUZm8B>6W=3,8+1FKr1A5YM+;]A_9C2^!Q
J`/!6rZ[1&<h(l#7AY<%jSIFLr8^j/ulXDmmD^p(sH_'G^*s)ZNH*RCW7Mi.nbN)p,FYVZ&b
@LZ9,<;U['oUfSJ#gK[1gHSD3G23!T(cH@OhBr=AB.;\Kp#llU6sSLRW$MT/CO#&?gWlV#FC
GL5WD.nX*oLKf@G+7q8J"#m'[P?YKu1&gK3pGYIfhjL/XbgHY:Ng/2\1pp5qNY'slqi4ZU$;
44(`56pcGJi=N[c^FQh("EuOb(Mk%J]At(ZqhYhdqU<AsGcFc<3ZO6;Fn+.g5_(bYK8rDY$_(
88?,BQANT_%pBGQ:fZ8iQWIJdj$D:Po`@-"ZqqNDTP#+?j"ns3UOHKj0^i:i%1$D\ofD'A;a
r0>q^mmn796+/)]As]A&L+a[ddtc1FS'Bj@pKq?\q:B[/FpKFRd<r?4rD`SqeXIO)NI0OF//o,
pR]AqGX=Tao&qfC/loqM.$fN3394D>TCP8"EA,e[J^,?FpE#WlPiV>0lWoeV4J7ao;1aIS<q/
EJ+o-W$OT*jiC)71J!W2o5rs/T("XhePlm!aM.bfN<?Z4^nT_0;X?o+jLl+kD2S=#m1r&Q7%
nl"K=Z?L-p!sU)>es'kf=V1C@4)2PkjLV;0n#7_?>NY&#hce-qN+5cg#=.rs+KQZpF#cN?"u
O4e,msr^Xhb]A%3/NIgD0]A_o\CL%Q15lkD(Zs+`.Or[4c(t[L=8+R;CuMW:HQSO;,0r2ACg0[
8rZM+b(D,ik_e%$FI^Q`-rT'?1H#,giY8WG%R_(YlS;14Z&>5h;Jc\/)lpct_UB7NLP=)4lU
lethLR!(,GG,r)b-JTRkhP6h;r;#[A+"aXmCVM-+s>G^Aq9Z^^ntj2dZ3ptg8K3;*K&3UmAn
'1\9^Bj\,76*>Y%:3gq`%c"ad(+,hu4G#=F2'KV6TU+euK:TslINKNuD64TFRAVET5V>D:1W
5n-Jn8dMd;0&KX(#K_L6Gp!O[Cp*lnYAp<,LY\LhGOKZiJI7sPDalJ%\/b#G^]A+#j!MRe_Ml
5Y-^bGod*\`0?4pcCu^:+P7j#OO?`.e[O+_*]A!OX=YJa)WX;*j\K]A&$_c?8lCt7AVYS(rtPm
Q"H_1f?Yrt_>cU/_LL$sZ#BZV=$+lmQ1Y5Db?k.G!#e[M^`t-eg_7@aK8oKupb,d?5qs!p)n
_o8rY7UbrI$DmHl7]A8Gbrn65\dU6jWB?Z\D`_t5=npr)`=B1e3M.$$]A.9J'[__$K-n"/cUXd
>sG@&TI+c#EF_%aeI6SV(9Ro?)-*TOnR@Yr((537D/GBAa>_cP2n2F/)VIfZD4)fg#=7hl*s
?Ag>N7MB$-7+,ogXa2-#7!kab!`(U+3CG.o(7Y@\o>,l;J*nUWp9/]A6/g8:&&&G_g%B^S]A+N
uSo"PH6ro-JLnb;d5*e1,:`WM^[HU\6S:D+Db>pa_,Jqu0?gWHJ":'X4-8mL^J5o))ko)M.\
Lb!9K4(?hnhF7g0QV<2@GQT$E,]A9bQA>f9f$!)AbBs)b8H&"N0k8XW&%%!0]AJ?rJ0NaXhMj$
:?BgB+A0Y.;0/C=p=*4/mZ\0HWO>^H,S6o$5QFRQ\!QA5:e(]A=V)gJ1SQtL_7o:B6:)9XFp8
/Zl(9uV8R.TBi?Kfm<ALms#tJ7IfQ//#&_c&"<,UH\b.C-1gZ[A)jKOSVU_?u!8AFCuTBTh'
/0T;ZV]ABW]AbE,!eM2PNK*^Hg8pB"mQSEng%/;QH[1lBqnW2E:pT5E?QcA&)=cLs/[W]A1aL<g
DQtA2WrAZY>SO8Q#WJ5d2Hl'8.O-K+uA@NQ<bV$:QL5(n`>b`9k1PWr[$TkI.Ii%%ZV-9)TQ
d5Z6j8dkc9De:KBCHS1pfpMIKpDE#m_FYM?2e(6ga"QmE/Pq@(pfNB;Zgnj:SV42V'q&qYJL
Ve')-LEZ.<4^3lm:=)lm@:=2;O/@U`bd'BJr9@,6,&Vo<oXCm8pMh\^1`#RfJ';p>#nhf`lk
\*-1Aru]A%q4#+j[Y8[7Bd*EBCW7j:j!VD;4E#liFn)6Hg#q(#u<C4H2-)Dr-:b$E\$U;FklW
Th$#F"W7#4,>rd`O^)HYellFFf!<4ID?Bd2DQWd\8pu+RXYO)TeTnLWK*pT;q$[;$'bNd9%R
P^4^kDWS?\7>6QQ'2n*EU>X?'!,ZhRaEPY4Ke=ooiErqG_[:BVK+qgq0d4)#GJj?0"%6=+V@
i8AgI#lRYhC1H2He=YSB+T8)6#Zt=$>IaK)/8'uIMQ3kMickJPh%LQ]A*l2[@5U6b0F`?OkRC
O_7H<lHP:c$"W1B`IV@7r!3qB\=2a\m)ZuSu^>(>ADifYk!M*VUaHd`a@6CE'p_['U)WLHu/
D8[2.huZt+fIk'`MsHQej]A>Ri*VZgnd,K^du0"To,*T*QtG#L&goF.Yj.LZW28qc]A#dG]A&`=
a?<9N1hcA6l=D-R'VWMWDJGP_BUKbY8c&,GShp-TqE'utB7R^GN4sL8o3kr999`)J6HCb2<,
sfocpjl/Btfp>$m!/N-HU-^T5;Z#EWtUN6B_Cr]A?8bN1+Gua&TRUr2"lGp+B]AI\[(XM&<LiO
6Hn/V-:T1=]A5=XrbcN6"hmFmnk8;+dmTq0.qkQn]A<r^CAi;9oCr(U:djA6En3-.^Z3KMAiqH
#iQ>-YtcW[Sbh9c(_G[r$f1M'k;NhX=?3KKZlYYI=7]Aa61M"J?b^5kJ,;Tu%>Ua<XUnULS2R
Hm@I6atJ(""-!hbSkh06Z*cF*fQ]A1T9A8J&!'o"'nsKD%O\c_"#5kl.n'A9,^b6^?%`l4IA^
39E&n^(\pT;4/_T>N17uZ"X8DGKLF4F=Is!Ma,,t[86MQ;X2R+a0XVj<I4]A2,$S1:("p@GgL
&tg"#g_8<.#E9h7^>AIR0/`:[GPK%Km6+k&.@]AnnT3nGk[+>D_2[Fa2h8a2V#\4;(*'*c[f1
bYmQfTJ<u)%eX()!4[/[M(Gdr98c&A>9,8H>WJ-Suo]A\gYBX2$%#lW2c,j[/F>E()*Pu(/BQ
.SCmBHZ0@<f3\DVb9f'g>i$W^Vg1V_osZ^,ROZ<gc>3[=(Keg#s,![GH4"c(Wtmfr?3&>pQ"
NTD4Xj/AuX0h2VO[4PZh6KLQn6o"cLdnA`A2'IV@V\9F\7%oB@eJrRV'Z=!`2G*:Q+/Gb1/H
eC)"<+.a*WdSY36-BV^AS#2mna>LQ?J^b.MA%F7LKhj`/W=EB00H=Hlhq&"p_jjpbjfQ4`qu
!76i_6SE4JDEE0hQ,jaXHt+cSdSK]A8>Go3j2>qgT'8Ff^(BQq#2Bpo0'Up'$6;\MM?;Q+3B'
\."Ff!qBK=598m0fC:73r"a98J@mW=L$FcmZNa\>_]A`'_[*cUH#9KVmM2T*<$qieHM@rq;$:
GQV?Pu.__r@?jnk2FRr\F%$lpfjUO0tI<unX8&K2(5TK-)[TRfrpjlFS!^Gbb1#iC;=:^h9j
g?kI:I&bY>d3N2VjijM\Dko_#j!)?d*h"6ssuQ-R7c'U(Y'5lhL'nI'fud2\5ugJ'(tA=;=<
Ttc9M>W-KSd`p,^Jn-UCm(s!rM2EfhZ,qIfkGNTgH)HaX%PR5b*Z`kP[N,pjF-:-^jeHI;kF
ITT\+j4C2J''&X?oht-Og+(K-+tRHZ;W9CnaoMe'/S!T"-j]A5Ad=EmTIReAXn'obbu0QB]A=d
::c%bMO#<l_[`LG,_(@22c@7uWV,$W"/t="?F^:Bum"+J,f<fs&&VT<Nn5VaiE_mo3<p1&'%
2&Mi\0"G*0lhG<c#%>0oP3@ar6*938G79<,g^@e7<`sq[]AJ0f2:p=\PO8$IpKX:rp4*^G=(p
bDPZ:3ZQ'IX$e%F=5OumMaORo$OnXUDFLS*-VGTSE0g/9CjcVS`Ve'1l1MS10p>]AXepciqLn
F(<"p>Xp[:[-oCWXtkLJEb9G/Cir2&O;WEK,'s[mI9nmh,Y5SM>A?j.&@$SfF,P^)";`@q)N
=3DHp^M85P?2".Z(c/CL^/-=Q7%\nn7j_@mXG+[!hbJ55Tgc>VP'!Ia8,GFljK'jH(aj2DFj
d0b'NubTRnmZ;qN<,<JANm\H$i+-#J/b!Uld_fG>2%c<.hj:'k=p$=Y-Ccfn3[C9pnfh89Tk
lATsUS<Ub_K,Yo69T$07cEBYS\JNZfOJWG)K/Sfi+=(@D4\DoH/33O)Ie'UEI"!BTeN]Aq'`2
\K*NTr+.-'26I($er!HKa%ME/tM;4@k2;t`ZLb^/:[[%S?!6usf3DS5mZjcj;W:5#_af@fBL
Hpl:EYI\B='p76OdU-?c`j>X/S8%b3f:77;)+LCD]ASeWi7F96q0tf/.$NIcQEDEr!+nb*B6/
/oVP9K(ApJ^kRGa'BU>`GGgFN(khI\ce=K+N.GD7Ou*@^'PN/@VNnn/n&B8+&2WbG,`<If,8
)D5RECkOmFd`ASIIal#uJf3LHApid\0)BmK2ZH[GE3Hk5*#2$0^l+ARTpn8d!X.h2,3"Pi49
o-O#FT.+n\;L.uNof[hQ0`C&OY!S<Q))7#D3,nS9+>),FP^'#ZY#0P<hVNfV9ES`"+*VNMDE
Ljr'\Nq\0fiU>p>pZ<b*%:m%Gud>E%)W/AWU#YYTiPW@sKc7oM?fW]ABRrhtDI3B1CKYnV/4D
^t#0&KIHYIL0@gE:[DKd2Cr9!;lSYaN,1;98%k-,R/)hSfOgA"fKlisOkj4*,@31%2_Kj3kU
p7m,j)[G6X6NLp1b)mG-IO&$<K(i\-8u5@5D?N-Mh#^JE'mKhD:(ulVV;CN=:\YiinE9)K;%
Z2?Fm1>$'jg^XDZIeu`<;]A&;pY!$E?)A4L5:2*4;,=5XEP[,jI:-MZ<j+CkOcgCI=H=&k>VK
YMQCUg7mWb\H&4)g'1T')So?;UY2H/0E]A2`]AEJ3.rd);E&VT+XWKP25]A9VEB8t-k+EgggQW&
&"c\k<@8MXV1/VQ^;9-%iOe2@>i`5sW]A:lc!B"OZ'K88uNo[p>-o$2(;/PAS*h4dDL?NGNK7
Xj<aViJ>sT<Upm[U_@[gDA!;F^QPN=e<*O.@ABG^mr:LbC0^38``N/<2==p]Ap:TIreL0cjjG
D53TO=j#%.\jO_\(WJl7-_Z`V]A;m#tgfZ>M-Uj4-U<`hF/9eTCqjHWEt]A'0_@t\0d#_lI<MC
p7E7;=R7Pa,iH5Uqi\sTZ>.?\2iG;l59KF.J,2q7qEDl;>@@q0KI43rt9aA>Lj_k*0Nc/51^
L.Qc;5)&QZK_,,kaVB*ds#+@)FPGIr1=2'-pBW(5&r\%il[,Vc=e*n`1dfI.`fNRo*FiZ=^X
[l$d(P)PK/`JV_?=cn(?9oYbDbk/=uJ==!.D1*"DcAW'io4c/C"(p>/B,Jk"Du#-M`Eg=V)J
@VN<b;00A3BNcIG:u!SSo=N]Aj8;g`L_fgRTib[\8%7Fft(%?Rb'&P7nl1#,pao-$kSN?N%L3
q/4?O#E\)*5F,2(=r\^Mrp'r^lMeNu!Xe!scc(CE(>X[!e#ocA==5rY)ANnD*\caX:DpcX8q
no^pZ'*KL/6^(]A8[/p'[_WR&[HnKk[-B0#lj&VI`1e%I!@N0S:qP`uR[3pT!IqHY'u1cJ[%k
%0'h0(hA$2T>;&Y#spSQg<t6S7_=TE^&!8/.Lm`S/&8#,IMf*k',0gPsn6Ini,3f'.,?uCNd
k?4Y14orO]A+mWU;m_X]A'Q)Im9UWJ^%ea?0dNpe'o653_`s/0%7Qn:J=.:,)+jF(CuOlNNJ8W
r@d>Eg:f#s$:@8j(i4Yf#`Gg9>hI=L>W0pJ=kV(G9f&`W2)=AC9\JDkU0m/%`3^9a[kojp[e
V_6"uJ)gi?+(c^qEoX$9$qa#3N?/"nX\`?%g2G-%iD8`ifUL?MIPk_csq4i50Ha&Jr.R9<#@
SbBm9@eX<-sfLN2iUZgunO(,;Y%5YkQhPetkTRA!V/Wpu\Y6H)q+P.UkD^RRC=0hbia#:rO(
u1P%qG$aEpJ)%inQIWo)*;6B[qcSX-jPZ3HprG)GLeVbm7T:FG`H0F4@\g#SVKGq>DK1tr^@
Nk-tJZ_jll/D/gg!smNk?'\<8T.%bseGaI>oia@dAXf#A2'k[O4d[%@]ATnFr_R=7Aoac!pn`
b\!q_3,<Cbb9HeYc26e,.`YMoiB,777(D`7haZT%Y8W++,$<go<r09bbX"iC'a`40K!R=obN
qXG`]A/N`ccQ'aq/=XA;b9jQ(tY?IkZ6IpRJ:T3DWb?=qhcL[4b"CBq*A1IeZ[;E<kA,%c?P^
LRqG3*gdhn,PHHc50g#cDmeT!V</LN`lMCDLF,s60YoVP8^C%87G@RX&?BeKnUm>-umgER6Z
p6.RS&E,>%K#42`UH3us3f..!OuMq1-/e&,;`W)8X2+ob0ik7.5gR2`%6#1m`H&o_fP>O&ln
_@8cWrTr.TA4\s']A2$f0Df\Rj`5pl$ZF(t>,L:AIs9]AKp%5k-hfS`^_2snqGdjY%g/bMTU^L
4f2WBG`VH!?'4_J8s0-eSVLZcl'KdF+eK"(,BAOt<@btP<P2fqjuG@Nm#_s+q*"?!EbZiOG+
YeGj$6P-qM1n$>9e5pcMG&i;V))FAFS-U_!'NKaDLPG=c(&2cF$s[er/jX9MMfhg@E\a!+)W
M/ck4Zb.*+^kBmE)>EO?6`Fe@.E)W)l$^7:ZJZ3rc@6"6mRPcL>;]AVSLX9oPG2S>Zja04*Ao
imjDpp[PpK!RLo4tTk\Hf!hiQ2lj78)Gh2*D@jJoDEEI/_:5dm2nVs8"0Eh>j2QI$)Rr[&f!
hKF?;OlI!bsURBl6o4>#-ej>S\XV7;0#Z/)mW#+.5!r1Z>ZNE_'=37<;DE.;:FV3d3^I%U:p
=&[/%Osur-o:<\A:LAMpSUGr4;<s9CBOD`"H3H((;([`bX8cC6$V'Jk)WVm_L&#dihu\]A/HT
7$G&OG4<X8-(%N4C\,,#%3Ea*,XpqDlo>BHJr]Ak\[bc>(!*gNPF=:O"&+9[VQ30QE;4L's&V
mGoC3r&)#u(6[c-I(aHEQPPl^9-@-8O/)j2@"V9[qp+Ka;9H5W]AT>u1o>-+AF`TL^KJO`#UM
eqL5k<d>JKdDW>2Uhc(]AA.,t)`If<anR!0J0]A2"BEeX_#9>+?9G8V]AF(XcC_fB)[a.2iaTR8
0BX[U>9E]AL;idU'4o(]A14QqrtM&S7[cEg,@7^[i[?50k686ZE@jcHG>=;09*Hh@dC4EP8aQU
YNA4AF77hZBA_fjkW(N8I#:41ieBP#[UukI[A;UG0#o==lsGGf[U*o*2NGm#2'+1gFrVtRFZ
eunA0ua3]A\=U=AB_E;Knf>UDq\cXfO]AUM+.4sl7Blc3lA'P*81AXUr^;Z#"lp`+.eGu92]A7`
1#F3<l_:S2r#euhk(Xcga#]AS]A4@0PE8Q@jbOGAZR]A48>c$rI9o6Yd72KbjE]A#cl^j5=0J3t=
t54Sn&>tXJpWI*&M:0[s8?.nSnT'U<iauirI4~
]]></IM>
</FRImage>
</Background>
<FileAttrErrorMarker class="com.fr.base.io.FileAttrErrorMarker" pluginID="com.fr.plugin.reportRefresh.v10" oriClass="com.fr.plugin.reportRefresh.ReportExtraRefreshAttr">
<Refresh customClass="false" interval="0.0" state="0"/>
</FileAttrErrorMarker>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[288000,1008000,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[190500,4000500,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="1" s="0">
<O>
<![CDATA[业绩同比分析]]></O>
<PrivilegeControl/>
<Expand/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList>
<Style horizontal_alignment="2" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="104" foreground="-526345"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m94@+;cgPBY'6\M("uj+g0e0$>''(U7A[j]A6BZZ8Q7@2Wl"K;q;[*S4MDRmj63sjHMHWQ`7Z
5?Mgsuh?=r9Qe;EcjnG`7JI8'3bY3!g1+p]AuP#P&h/1l`NkRR?^rWs"OB/8']Augm(K%cI@fV
MP=(h%nC^UOn>),+cg:=CY1r7%1P=ZHo5Cu`As/cKLqCS!nHk4[^M`FCl):S&bO3,5VnKO8@
;1u&V2SgEIb0=fDOJB7n%nIAQJbTRIXEA]ApYiDn6@.b+O7lo:fR?;3oCqf%9*Z7bP)jUMKLI
&-Y>SeHVh2]ABL8cHF-@&JLh;Z/\UUqMLMGCHN08S%UJS$WF26!a"bAIb*PlLciae:DOK?%p/
f`r2:-$+#Rrtt(\`UIXSZK06U=5P:lKiUfVlb-H,:*L@`E4TYW.n,A;bM#Znq0.Y!M@>`XVm
-/7;*o=!M$oc3\YHcg7cE*YSQo=s$b%$/"hXP1gWfmPCt$1D;Ht$tJ*[dkH7DINdbksh1MAV
67WcC(n#&)J8'(!T`qUkPQ_4'@c8*dth3s[s$7!B7<#pI=osrF$D&-0a`MX?_MCeO#oAQPej
Su8iEC7QFeWl,gH0))&T$]A4uCMOJK+[FMOS*.C`E,3UUk(NWn6eV?ggJu#_S(M$GGKM3%c"c
!1[!nEV?;N,!iiM:GQes25br8dTp]AQX:&$(ue#o26dEc^,)a"eRN<(P)gXg\`U03P("s4DIE
ob9+jV\C`W%C/C&Rs'7sZF[E"JOU[f+ftFZVda=PctWT,TKgg/"ehB?[j]A5!"Yh:.fec1Fpr
l[t$0Zgc=ij**8oM*_(2\+tN-6aFki]A((P1P2NS']A4--knLmJpS\IUMMP:l(@\r%q)YaID4(
-DVTN*<M'5ek"8Bd_L6mRqaF&;-%FS$\kLW7[Q^8/2r`1"jLYN<A]AsmM9R6VM&<dos'Ae1l7
*U)V5p=ePK1&at&iL38KF*urS\+IhK".>9]An/(7o0MM@,PPsG(Le3mdj8]AV%72[S8SKTA)NV
-2'QCn<aP@s(lMY\EL-c%,]A>ck@[:RNK.hkEQ<T;U;H7J2B(/I#Ple^T:8@QWP_Qi/caj$j3
[YcW+?:2FXq&QsDhSX8N>YH'tU49f>\^2<iBoK^I/ITYZ#>^ac&;l_)%h/mgI,f4I$a*,tHC
i>j@-8ZaCljZYUhHl>QVfub8_;O^'ZBbo;=)'F.pUV.U.+L/cGC95>:hRaC[Pr>s32]AHiWfg
EK.D-"`bOUlG-9ib0RY.UL>+9spUE;Alm\pX^ikR*(HCd7@u4*OSF(3t+*#A]A,>sr^7+g:I*
*gZFW2)c2RT`XcCK7A/8dM:6M(L[(1u_feF.\`=3d4e0nJ<q4`&!(a^U;_-331rO2t_%;*Bm
4&Phjk8rAI8h'P1Uo@dP.j"IS.s8E(?M$@3k_p#^:>Es%sVAd/\^jo;*L1Gi!\-$t;D37lG'
$kE*3L<\maE1Og1R%+MlQG%\Yh=lX.2k$i=N0ucp(_=m`S$K_((tn&cm?Z\AAp-;-R:J59S=
7*^UNuB'_Ifo9NE1m0i?p^I&Rd1.C,ie&]A"!6ni9hVg3Vjn<qX,-8#V4q'[Ia>6D"((gLq6i
$%b699g1k-rV*Z$]AhJd&!BZA`6r-`f7gNle.)9JM/.C\3+EmOicEcd"c&0d:S[EotZ<qE`H<
qEUdl87?21`*M2CDN.nQ'J0Fa]AYHbY.:*@+,U!^1i=uaCjT-.CA\NEG.&0WP$#i`ijq?b.pl
%38Ee+W$;`QpC#a/=7nmK-p?ORh4_V"1rtV\PG=nYC[Chh)q+mjqG-tJnV0"FRY'`pFCr8B!
ln48`B5Ura,?]AV(gB/9$H0X/0_qVNhhE45CLg^tCFtI1!A=YJpL_,D:8rI5!,Y`irSSfG-E5
"+<#-PKAfkFBNN!`s#,CO)(-*HQbU;a6Yc#JV,Kn?_8O?R<=*=]A=fQj?$O7SKd2hd!0@2T4"
U1-UY('1U@doC$pWMu?VOD@dT9l^URPVlAUMg$D^,`iQf>&NtDa]AP2Or3K6n;rMJ.njpT&>j
W(-So9mO$.IKNj-12P8#>^2?W_d4rk"s2dEKVA(K]AD7,pcN426>%QeL%G0dSs2;EHF0gj4[6
j+LQU]A;;q]A@NM!KfNZ9"!:8g;^F3aKfnr),`:LjOL?jEd@?O5mJD"4u3-96*"7!:mJrSSPZO
YB3k^I`g&M?Z==CBAjH/'^i(\k5s=d#t5EZ6MgJ84lUI4IfQ2K;Zl_(+^GlLmRA+W4+N0)Ci
7PonbUT&kR:.4YLK!]A-GEa/H"BZL.Wd8koPLp-SIPoH5-Iq"N)8WP.I8*C@rV'dJ$]A*/$X(\
"?)_MF>nmoR:"Ps0@hYJKm\0&@[sRGkiiETV;ElI#BT/kL_Pb?8/ah.(BoS07Y_7ddKs=;Yh
A;;U(JM,Y_l\K2V/lN^JHe4+H,+/;H$_uj+Du(D$WHJr&EZKE6Da=!paW-\?HZ8rdK?m0$2q
XqCJqHui4@drWS0b;rGYnr1Nr&?PJ>.\H=&rk?j[u]AOlLF>;N=Zc.bGf/7$:IlrI2[9m9G]AH
Oa0IKK6Ac5F5XoLJ.=g#JJ7%t4hQ\4?CpuJoh#)V]A>ODF?h'N>Hln,QO&%q0X4XMb(9d.<WD
qG/:dt[7'>RG`p-=oBSi=+_nI%R7lW>`F![):P"V)n?8W\(U1Dj"M.O'jYEnSs3#l]ABj2U;Z
hoB(D<i?f_:hQ%Ue$l_!%Gmo`eG]AZmSWs6$2=X)&/MT<1bR+MA&HKrX]AorN3UZXZa'nbmrdo
HYgE2m'*d5S/`#K0=.H+0tnOkQ)5<dZ@##^J='k:/EIp&a!*[#*VB9R0+VEje+Reph"3(0c*
)/DZShspi?g&E''$V=Cf8u7VpAG0fN>J@\!2F:KfAD12!(XQO6DQ&scQs=s/;1&2Q'\6q8A1
?lpdm,@D(lIZ,;i9C;?V172`V*[hOWV4rqaT6m%N'C7k;6aX54lEB.H%s=>\BTIYUiq9?O/i
OAfqu(K[.Z+E1e*EAEA""t.]A@9.i"Jkb!&R#)ILt_O9,bgoW+PJ3*7JP%iqe_.(diL>es0U_
&2%uLYHC(]Al2h;65idWf%ms2*^EK[T$Rq"]A,d??5)5'fUET>YmG:Ir[A*L*4ba8UeD01?7B\
3E$5F&j!R8>PZn.*Q?(,SpP0oh":b2V><=I[/u?D:-#jEp%*EIqb^b'\1B-9Y/4WHorLD<`O
(b0`[[!ZO%FrOHr3dbC$P2!&XU@A23<N>>9*&9BRK2fo,0^rs&5i@MXh^NaA\J2In9Bm)/hp
[.#'2]A/MUpH2T]A,''j'I[u@aT.K%1gBdjks;!&?kh%L!C[,?5E!?]AQu,CZ0C7b]A`'AU$($oL
pLZ\leLrQIlBk=PA5E)ec,Nea2kCPVJaGW99V]A#"(TV/U:AHZdP.%"`uM0OC0cN$oi+@SGIf
=%#JUqD>]AJm>%:CR$3bL)/dOihO'gLh"(Utb+?d&*XC!=357-LqoL04^(XfbG!<K9upNh<+O
09*UO6GW0@18rU#O%*lh]A%h0F?X7K2ULY#)$'#Pr0lpJh$$&+ZP6_-rF=KRODA$,O-m,7b+^
kr>4S8c'nLN[^B-IAj1"oYJYlL&AK?6OrPq>'90]A7_Db#+,^m()=_75""MV!\,7:T;>p160d
"/mIUAg%25/YZ.1,0]AGhqkNV>DGh/&]Ao/VZ0P#sKS]Ae))'OUr6@uY%>#$,q7[+aI1UEB`s5j
P`pZsu*%A'M]A$dII)']A9hAt/;d%.dk]A=t2^Hm$8n:qno@e.h9jlj?^t:W$.F2Z4]AtI[6TQtt
&bu=]A:f=Xcm%8IJ`ZM%"NU&cHrL'mro<n[jD-%pWGh3W+e=t@B"L9VOfA6''9RhKK552#Om9
Ot\aU7!2n)_7_g[fT$nKSYl]AOnHU/BQ':pVbR+d'r#7S!rL7g'j\[r98+\mCdf[*oQpd@RQT
DcKki<BMsl,]A9Lem(Z[q]Ai5aBI?>QWZdQdJ1N0SMHH%XkHFj?,_:"UjShTZRP%d.u'Zb"CA$
4EC8[`%OBW=!!ou8B,N]A7T:=KdllT;UO%?_(oY?`S@*DdWea9<1B>AIUjuXi;PjLD\r@::R7
k0H'1$3T_J.DKG5_3L_+5_<NW(5,%'JDYB@hLR6ch7:pH'.MpA8gV%UW&0)^Na=8r=T!UB,D
@mB&Yk[W!ZB_1e3[6c!o+ik08W<.ME6D\7.<R%.H)^l)=5^bF!",%'qb'/3-6Os!goJsudl`
XK\G]A[Y4,&=19J;Cn"t*O)k+Y&SaSSr@),PXR!V^JiX]A=S\>?Jk>N27FQie8MuuN>ur!7,bP
IW:R]AWTN>N3YE3%Dm<g)Wm$@8iN]A[>3;(A'lc;\Zs#oLiBM`d-LGc\4oBaRqZLNM8j>4X2mA
4j(V/aWIZf1Ga*'VM0j`q&OV1Q3(ukXOIHa'`GKIHG.DSRi^Ao8A'7hU<g%^9U,ZRcl[dTSo
:_ZlM+^k#KBZjAj(hMj+GfkR8+sJmrrNF6uog7_H8RtE%l9W2D(jd1C<0`4e'!T^'VoaK7]AM
(-u@Gc>u-7]ADOGpPEg,Te5`qM6n,V^#.oauh@F'iQfUQ>4]AT)5npRt8na%Ds"Qhd69"-%)HA
u#]A!)?L[unThqHV/&JI&<qVIrCf[8CB1@;Wb$/dVh`Bmd/6Nfs/B,K`#ZX"V\lP]A##_ce\ll
FZ>N(&A""VF0AC]AVnKSYGL'H)'X?r?HSJQ-S%Q1R:<oK?jm:i5`9B.]Aa5oqt:nNXY6Rc@P_Z
=D9B"'rJXfO(l"rb\p=N.Rbpu(g(KeWes'VQ6&NSBh7d\ItAs+?k>53?6a7,>G0]AGEn'>Ld4
a:t=k*SZ_%RuXplW#qmdXq,eP32laEE]AU)9nU-$"j_f;@%XGSR;?mh'"npU:j#JACY"a-r#k
Pf2J&*Ycmo$"c8pl.@'f+jjdpG/rT3p?G`d,hMV%(OFQS'8(Nt'f6a.h*r~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="250" height="150"/>
</Widget>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[723900,723900,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList/>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList/>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="12" y="19" width="201" height="189"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="report5_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report5_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="宋体" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="2">
<FRImage fm="png">
<IM>
<![CDATA[m<IeQ*74C;Om"ZY&knAuU:2OZe<$WH.+)h[M)&8AM'+'I7'ro?LT&US&V?sVNR!4)b96YK0l
QKns2=fnpYkI]Af!EZUHgQ7,HM6%<HQrW03bhE)&eYhgB0)L$,UB2Ps7VG:jSs%<kT<D0P'b?
t1tBCX3W$?d7c9]AC"+A46b_^aC:FT8Ng<M-[3K$."4mtCh"IA.V)ANEJ;cCsol,as(#iGOYn
:R3RS%BT25rl%PrJY>YSAMJ;]APOXS<uiGA4/O#5kH?pu7e`CMQTMKCY_d8C$O,a_*HUiqc]A$
u,FaKdEo.N]A_;Gfi[qMaf.:F>UphK'd*5J2t%3dLts3tA>djF//`BY=Y;rK\c\&XWr,GI9DL
[,3*05UlChKmu!J4;6jr]A21H0^".mQ(*#JH$c(;oK09mS98k+QM&)/\Us]A%D4'oRp:I7:Zot
[Wp/T[#9_e_(%e>T]AelQf-Y"27QLj5N8[j-,Y6i6LA/Y#Y>DGb!fpZfXo(N\lcoRP+&rgF)d
>h44->n%8Km/1uS[_Wb5i`KK4f,k_jr*RB'MEVQADL]A"eEjasdk.luk,#laHAn[KWM?]A%j.[
//M&@"GnEOa85C)?P-Xj7OrcO?`1Af?%Ys.4gp8l?3up83b$BA?+B?a+%"&d!Qafm_5l,f;7
/EE$-)jj;AB?a/"(V0.>>>Y6:h3*4Yg[#hO&qcAcX^o#&,dg^E7CI$?IW`iQ<0de='T?0CSS
/nHc>mr$:k@_PDp2d9J1i"(*0f:>uj,#kG'YP=\[OuK8&^U(s?l.B+]Ai4'+kO[l(1:J)]A\28
Fa;_"Z7*N#9S:hr\j7;774*Q&f.lV:jJh2rZCf<L7o/.p'^@XGU)]A_QqD4+65H*0,R$Y-ao6
.b]Al5meHNp#@Qh\E$mKV0^6.9^6r4625@lXi/T!3;eLL2Q\K(d/JA18Himnpla'4$PMYnK@e
CqA/;_1[#NY5-:B$aD_8uN3U8s[R:MeYnQc)QbnG@/$joY&@Ko!MIjRo5>iXq>.`%j-#'J+l
`=^+*PD>p\Z[O&PO)83,3Was/WZ'^38P\tElu!=L:4m)8/=GGU@LQ<AEXTj9F,A>Q9WfbfY3
d6j2kJ8\GPlN:>hhCADnhD>P+9:-OV\0'RXOU;'=5rqsnB=0SQ`O4IK`RQ"H$#bgYU$Lc*7&
7UOGu/_<'Fa*d)priJai)BW-I<7&gt3^DTaaXV%Acq$eX[k%f=dEu0G.QlI[S>el]AbH/l]Ad7
FoQJ(t_VuH+=Na#)]Ap5:6Y_t-;WGgT3@77JX/u_PJ0:T+I%e=CmhY*K2kj%mCk@Z-N9rI?iU
i)`dQe'k/!ot:J*toG9?KNbc*WWLG]A:urq-Bc"E^F+<=89m$tPc!'&lO2Gb$Dr;/0B'1e/bo
f2aJ;j^^eA8+KR-F&<fqX'!pX,#=5SUu0hT.aUuE0AKf./O9_H]A,!l,bp+[OTQ>NLdY]A(UtB
hjK/WB?*2O9oTq/4R?OH?ofL^$f8E;-h:Gp,@(?^K+AW]AJ&T<oGt?*&p"923V/$RU+;;qD-e
R'-7l62d+k1Jb^./=_+SMfL*:Qgb?gqi?/ha7\rn84g`rc#[+N+cXD^=m%D1%++@Jp!Yh$4k
-+2Zio<!V=X3AP08[TeQTN#`8a37&mK95X2^n&1GX[7r2l("1[p5N\NI6kZN&OOs?O`EkJoq
=]Ao,[J]AltS(a9Wa;W_84%_GU%_0l7=Gg(d?/`#Iq!5tu5P@cHG9>MLRE?&u(B?44\MYFuf4V
r.@@f%A^b6b`S5o5TU&(_'"'PXep6!PG3^*FIq9l#oq$(<6a&(cX`t0Hjh#1]AOcMMkI0k!K'
]A08A"m?e?@M!mGG>+!I4%Ot8`6h?<jLX43&0q(Mo\Nk!sZ[fqO:+90K>"4&]A>?@:t3]AX1MlC
C>gn&MpTU9c6<]A-T+^_g#,\G4C[ERb`ZbN+SH%QslBV,/kb\I,H?Ig,n-5HR3-$jbi@H9EVT
FPMH2H58of>!8^:Z*D5CA^DR?g:'LmV*ocilO/"XJOE^:Q%`jmR0pfYJnXJl9fe6ErXf]Ai?.
MVS;[F;<eO`a;),?$l2]A=,C,[UtWclW6$8=pb"/!F(#Qn_qI?=7QY]AGTWkfPXZa$r=.PYQr,
2Hf&,(F,N'u557YK('!-=0!QR#!LU[;F;$*<=8`3p:7C'&b4WO?MPHrY1%&4LT&:aQTqQMRO
FCp88)%iGJ$RR>M.1X<lKPl4//r72VF$KsDbP\==(aRuE-1.H%M=_j?D"L1\nA:\S,@Zhh7X
JcscE)/lMU9Bgr#?mk7SZO/:3<&2>Y939=jODk4uUZm8B>6W=3,8+1FKr1A5YM+;]A_9C2^!Q
J`/!6rZ[1&<h(l#7AY<%jSIFLr8^j/ulXDmmD^p(sH_'G^*s)ZNH*RCW7Mi.nbN)p,FYVZ&b
@LZ9,<;U['oUfSJ#gK[1gHSD3G23!T(cH@OhBr=AB.;\Kp#llU6sSLRW$MT/CO#&?gWlV#FC
GL5WD.nX*oLKf@G+7q8J"#m'[P?YKu1&gK3pGYIfhjL/XbgHY:Ng/2\1pp5qNY'slqi4ZU$;
44(`56pcGJi=N[c^FQh("EuOb(Mk%J]At(ZqhYhdqU<AsGcFc<3ZO6;Fn+.g5_(bYK8rDY$_(
88?,BQANT_%pBGQ:fZ8iQWIJdj$D:Po`@-"ZqqNDTP#+?j"ns3UOHKj0^i:i%1$D\ofD'A;a
r0>q^mmn796+/)]As]A&L+a[ddtc1FS'Bj@pKq?\q:B[/FpKFRd<r?4rD`SqeXIO)NI0OF//o,
pR]AqGX=Tao&qfC/loqM.$fN3394D>TCP8"EA,e[J^,?FpE#WlPiV>0lWoeV4J7ao;1aIS<q/
EJ+o-W$OT*jiC)71J!W2o5rs/T("XhePlm!aM.bfN<?Z4^nT_0;X?o+jLl+kD2S=#m1r&Q7%
nl"K=Z?L-p!sU)>es'kf=V1C@4)2PkjLV;0n#7_?>NY&#hce-qN+5cg#=.rs+KQZpF#cN?"u
O4e,msr^Xhb]A%3/NIgD0]A_o\CL%Q15lkD(Zs+`.Or[4c(t[L=8+R;CuMW:HQSO;,0r2ACg0[
8rZM+b(D,ik_e%$FI^Q`-rT'?1H#,giY8WG%R_(YlS;14Z&>5h;Jc\/)lpct_UB7NLP=)4lU
lethLR!(,GG,r)b-JTRkhP6h;r;#[A+"aXmCVM-+s>G^Aq9Z^^ntj2dZ3ptg8K3;*K&3UmAn
'1\9^Bj\,76*>Y%:3gq`%c"ad(+,hu4G#=F2'KV6TU+euK:TslINKNuD64TFRAVET5V>D:1W
5n-Jn8dMd;0&KX(#K_L6Gp!O[Cp*lnYAp<,LY\LhGOKZiJI7sPDalJ%\/b#G^]A+#j!MRe_Ml
5Y-^bGod*\`0?4pcCu^:+P7j#OO?`.e[O+_*]A!OX=YJa)WX;*j\K]A&$_c?8lCt7AVYS(rtPm
Q"H_1f?Yrt_>cU/_LL$sZ#BZV=$+lmQ1Y5Db?k.G!#e[M^`t-eg_7@aK8oKupb,d?5qs!p)n
_o8rY7UbrI$DmHl7]A8Gbrn65\dU6jWB?Z\D`_t5=npr)`=B1e3M.$$]A.9J'[__$K-n"/cUXd
>sG@&TI+c#EF_%aeI6SV(9Ro?)-*TOnR@Yr((537D/GBAa>_cP2n2F/)VIfZD4)fg#=7hl*s
?Ag>N7MB$-7+,ogXa2-#7!kab!`(U+3CG.o(7Y@\o>,l;J*nUWp9/]A6/g8:&&&G_g%B^S]A+N
uSo"PH6ro-JLnb;d5*e1,:`WM^[HU\6S:D+Db>pa_,Jqu0?gWHJ":'X4-8mL^J5o))ko)M.\
Lb!9K4(?hnhF7g0QV<2@GQT$E,]A9bQA>f9f$!)AbBs)b8H&"N0k8XW&%%!0]AJ?rJ0NaXhMj$
:?BgB+A0Y.;0/C=p=*4/mZ\0HWO>^H,S6o$5QFRQ\!QA5:e(]A=V)gJ1SQtL_7o:B6:)9XFp8
/Zl(9uV8R.TBi?Kfm<ALms#tJ7IfQ//#&_c&"<,UH\b.C-1gZ[A)jKOSVU_?u!8AFCuTBTh'
/0T;ZV]ABW]AbE,!eM2PNK*^Hg8pB"mQSEng%/;QH[1lBqnW2E:pT5E?QcA&)=cLs/[W]A1aL<g
DQtA2WrAZY>SO8Q#WJ5d2Hl'8.O-K+uA@NQ<bV$:QL5(n`>b`9k1PWr[$TkI.Ii%%ZV-9)TQ
d5Z6j8dkc9De:KBCHS1pfpMIKpDE#m_FYM?2e(6ga"QmE/Pq@(pfNB;Zgnj:SV42V'q&qYJL
Ve')-LEZ.<4^3lm:=)lm@:=2;O/@U`bd'BJr9@,6,&Vo<oXCm8pMh\^1`#RfJ';p>#nhf`lk
\*-1Aru]A%q4#+j[Y8[7Bd*EBCW7j:j!VD;4E#liFn)6Hg#q(#u<C4H2-)Dr-:b$E\$U;FklW
Th$#F"W7#4,>rd`O^)HYellFFf!<4ID?Bd2DQWd\8pu+RXYO)TeTnLWK*pT;q$[;$'bNd9%R
P^4^kDWS?\7>6QQ'2n*EU>X?'!,ZhRaEPY4Ke=ooiErqG_[:BVK+qgq0d4)#GJj?0"%6=+V@
i8AgI#lRYhC1H2He=YSB+T8)6#Zt=$>IaK)/8'uIMQ3kMickJPh%LQ]A*l2[@5U6b0F`?OkRC
O_7H<lHP:c$"W1B`IV@7r!3qB\=2a\m)ZuSu^>(>ADifYk!M*VUaHd`a@6CE'p_['U)WLHu/
D8[2.huZt+fIk'`MsHQej]A>Ri*VZgnd,K^du0"To,*T*QtG#L&goF.Yj.LZW28qc]A#dG]A&`=
a?<9N1hcA6l=D-R'VWMWDJGP_BUKbY8c&,GShp-TqE'utB7R^GN4sL8o3kr999`)J6HCb2<,
sfocpjl/Btfp>$m!/N-HU-^T5;Z#EWtUN6B_Cr]A?8bN1+Gua&TRUr2"lGp+B]AI\[(XM&<LiO
6Hn/V-:T1=]A5=XrbcN6"hmFmnk8;+dmTq0.qkQn]A<r^CAi;9oCr(U:djA6En3-.^Z3KMAiqH
#iQ>-YtcW[Sbh9c(_G[r$f1M'k;NhX=?3KKZlYYI=7]Aa61M"J?b^5kJ,;Tu%>Ua<XUnULS2R
Hm@I6atJ(""-!hbSkh06Z*cF*fQ]A1T9A8J&!'o"'nsKD%O\c_"#5kl.n'A9,^b6^?%`l4IA^
39E&n^(\pT;4/_T>N17uZ"X8DGKLF4F=Is!Ma,,t[86MQ;X2R+a0XVj<I4]A2,$S1:("p@GgL
&tg"#g_8<.#E9h7^>AIR0/`:[GPK%Km6+k&.@]AnnT3nGk[+>D_2[Fa2h8a2V#\4;(*'*c[f1
bYmQfTJ<u)%eX()!4[/[M(Gdr98c&A>9,8H>WJ-Suo]A\gYBX2$%#lW2c,j[/F>E()*Pu(/BQ
.SCmBHZ0@<f3\DVb9f'g>i$W^Vg1V_osZ^,ROZ<gc>3[=(Keg#s,![GH4"c(Wtmfr?3&>pQ"
NTD4Xj/AuX0h2VO[4PZh6KLQn6o"cLdnA`A2'IV@V\9F\7%oB@eJrRV'Z=!`2G*:Q+/Gb1/H
eC)"<+.a*WdSY36-BV^AS#2mna>LQ?J^b.MA%F7LKhj`/W=EB00H=Hlhq&"p_jjpbjfQ4`qu
!76i_6SE4JDEE0hQ,jaXHt+cSdSK]A8>Go3j2>qgT'8Ff^(BQq#2Bpo0'Up'$6;\MM?;Q+3B'
\."Ff!qBK=598m0fC:73r"a98J@mW=L$FcmZNa\>_]A`'_[*cUH#9KVmM2T*<$qieHM@rq;$:
GQV?Pu.__r@?jnk2FRr\F%$lpfjUO0tI<unX8&K2(5TK-)[TRfrpjlFS!^Gbb1#iC;=:^h9j
g?kI:I&bY>d3N2VjijM\Dko_#j!)?d*h"6ssuQ-R7c'U(Y'5lhL'nI'fud2\5ugJ'(tA=;=<
Ttc9M>W-KSd`p,^Jn-UCm(s!rM2EfhZ,qIfkGNTgH)HaX%PR5b*Z`kP[N,pjF-:-^jeHI;kF
ITT\+j4C2J''&X?oht-Og+(K-+tRHZ;W9CnaoMe'/S!T"-j]A5Ad=EmTIReAXn'obbu0QB]A=d
::c%bMO#<l_[`LG,_(@22c@7uWV,$W"/t="?F^:Bum"+J,f<fs&&VT<Nn5VaiE_mo3<p1&'%
2&Mi\0"G*0lhG<c#%>0oP3@ar6*938G79<,g^@e7<`sq[]AJ0f2:p=\PO8$IpKX:rp4*^G=(p
bDPZ:3ZQ'IX$e%F=5OumMaORo$OnXUDFLS*-VGTSE0g/9CjcVS`Ve'1l1MS10p>]AXepciqLn
F(<"p>Xp[:[-oCWXtkLJEb9G/Cir2&O;WEK,'s[mI9nmh,Y5SM>A?j.&@$SfF,P^)";`@q)N
=3DHp^M85P?2".Z(c/CL^/-=Q7%\nn7j_@mXG+[!hbJ55Tgc>VP'!Ia8,GFljK'jH(aj2DFj
d0b'NubTRnmZ;qN<,<JANm\H$i+-#J/b!Uld_fG>2%c<.hj:'k=p$=Y-Ccfn3[C9pnfh89Tk
lATsUS<Ub_K,Yo69T$07cEBYS\JNZfOJWG)K/Sfi+=(@D4\DoH/33O)Ie'UEI"!BTeN]Aq'`2
\K*NTr+.-'26I($er!HKa%ME/tM;4@k2;t`ZLb^/:[[%S?!6usf3DS5mZjcj;W:5#_af@fBL
Hpl:EYI\B='p76OdU-?c`j>X/S8%b3f:77;)+LCD]ASeWi7F96q0tf/.$NIcQEDEr!+nb*B6/
/oVP9K(ApJ^kRGa'BU>`GGgFN(khI\ce=K+N.GD7Ou*@^'PN/@VNnn/n&B8+&2WbG,`<If,8
)D5RECkOmFd`ASIIal#uJf3LHApid\0)BmK2ZH[GE3Hk5*#2$0^l+ARTpn8d!X.h2,3"Pi49
o-O#FT.+n\;L.uNof[hQ0`C&OY!S<Q))7#D3,nS9+>),FP^'#ZY#0P<hVNfV9ES`"+*VNMDE
Ljr'\Nq\0fiU>p>pZ<b*%:m%Gud>E%)W/AWU#YYTiPW@sKc7oM?fW]ABRrhtDI3B1CKYnV/4D
^t#0&KIHYIL0@gE:[DKd2Cr9!;lSYaN,1;98%k-,R/)hSfOgA"fKlisOkj4*,@31%2_Kj3kU
p7m,j)[G6X6NLp1b)mG-IO&$<K(i\-8u5@5D?N-Mh#^JE'mKhD:(ulVV;CN=:\YiinE9)K;%
Z2?Fm1>$'jg^XDZIeu`<;]A&;pY!$E?)A4L5:2*4;,=5XEP[,jI:-MZ<j+CkOcgCI=H=&k>VK
YMQCUg7mWb\H&4)g'1T')So?;UY2H/0E]A2`]AEJ3.rd);E&VT+XWKP25]A9VEB8t-k+EgggQW&
&"c\k<@8MXV1/VQ^;9-%iOe2@>i`5sW]A:lc!B"OZ'K88uNo[p>-o$2(;/PAS*h4dDL?NGNK7
Xj<aViJ>sT<Upm[U_@[gDA!;F^QPN=e<*O.@ABG^mr:LbC0^38``N/<2==p]Ap:TIreL0cjjG
D53TO=j#%.\jO_\(WJl7-_Z`V]A;m#tgfZ>M-Uj4-U<`hF/9eTCqjHWEt]A'0_@t\0d#_lI<MC
p7E7;=R7Pa,iH5Uqi\sTZ>.?\2iG;l59KF.J,2q7qEDl;>@@q0KI43rt9aA>Lj_k*0Nc/51^
L.Qc;5)&QZK_,,kaVB*ds#+@)FPGIr1=2'-pBW(5&r\%il[,Vc=e*n`1dfI.`fNRo*FiZ=^X
[l$d(P)PK/`JV_?=cn(?9oYbDbk/=uJ==!.D1*"DcAW'io4c/C"(p>/B,Jk"Du#-M`Eg=V)J
@VN<b;00A3BNcIG:u!SSo=N]Aj8;g`L_fgRTib[\8%7Fft(%?Rb'&P7nl1#,pao-$kSN?N%L3
q/4?O#E\)*5F,2(=r\^Mrp'r^lMeNu!Xe!scc(CE(>X[!e#ocA==5rY)ANnD*\caX:DpcX8q
no^pZ'*KL/6^(]A8[/p'[_WR&[HnKk[-B0#lj&VI`1e%I!@N0S:qP`uR[3pT!IqHY'u1cJ[%k
%0'h0(hA$2T>;&Y#spSQg<t6S7_=TE^&!8/.Lm`S/&8#,IMf*k',0gPsn6Ini,3f'.,?uCNd
k?4Y14orO]A+mWU;m_X]A'Q)Im9UWJ^%ea?0dNpe'o653_`s/0%7Qn:J=.:,)+jF(CuOlNNJ8W
r@d>Eg:f#s$:@8j(i4Yf#`Gg9>hI=L>W0pJ=kV(G9f&`W2)=AC9\JDkU0m/%`3^9a[kojp[e
V_6"uJ)gi?+(c^qEoX$9$qa#3N?/"nX\`?%g2G-%iD8`ifUL?MIPk_csq4i50Ha&Jr.R9<#@
SbBm9@eX<-sfLN2iUZgunO(,;Y%5YkQhPetkTRA!V/Wpu\Y6H)q+P.UkD^RRC=0hbia#:rO(
u1P%qG$aEpJ)%inQIWo)*;6B[qcSX-jPZ3HprG)GLeVbm7T:FG`H0F4@\g#SVKGq>DK1tr^@
Nk-tJZ_jll/D/gg!smNk?'\<8T.%bseGaI>oia@dAXf#A2'k[O4d[%@]ATnFr_R=7Aoac!pn`
b\!q_3,<Cbb9HeYc26e,.`YMoiB,777(D`7haZT%Y8W++,$<go<r09bbX"iC'a`40K!R=obN
qXG`]A/N`ccQ'aq/=XA;b9jQ(tY?IkZ6IpRJ:T3DWb?=qhcL[4b"CBq*A1IeZ[;E<kA,%c?P^
LRqG3*gdhn,PHHc50g#cDmeT!V</LN`lMCDLF,s60YoVP8^C%87G@RX&?BeKnUm>-umgER6Z
p6.RS&E,>%K#42`UH3us3f..!OuMq1-/e&,;`W)8X2+ob0ik7.5gR2`%6#1m`H&o_fP>O&ln
_@8cWrTr.TA4\s']A2$f0Df\Rj`5pl$ZF(t>,L:AIs9]AKp%5k-hfS`^_2snqGdjY%g/bMTU^L
4f2WBG`VH!?'4_J8s0-eSVLZcl'KdF+eK"(,BAOt<@btP<P2fqjuG@Nm#_s+q*"?!EbZiOG+
YeGj$6P-qM1n$>9e5pcMG&i;V))FAFS-U_!'NKaDLPG=c(&2cF$s[er/jX9MMfhg@E\a!+)W
M/ck4Zb.*+^kBmE)>EO?6`Fe@.E)W)l$^7:ZJZ3rc@6"6mRPcL>;]AVSLX9oPG2S>Zja04*Ao
imjDpp[PpK!RLo4tTk\Hf!hiQ2lj78)Gh2*D@jJoDEEI/_:5dm2nVs8"0Eh>j2QI$)Rr[&f!
hKF?;OlI!bsURBl6o4>#-ej>S\XV7;0#Z/)mW#+.5!r1Z>ZNE_'=37<;DE.;:FV3d3^I%U:p
=&[/%Osur-o:<\A:LAMpSUGr4;<s9CBOD`"H3H((;([`bX8cC6$V'Jk)WVm_L&#dihu\]A/HT
7$G&OG4<X8-(%N4C\,,#%3Ea*,XpqDlo>BHJr]Ak\[bc>(!*gNPF=:O"&+9[VQ30QE;4L's&V
mGoC3r&)#u(6[c-I(aHEQPPl^9-@-8O/)j2@"V9[qp+Ka;9H5W]AT>u1o>-+AF`TL^KJO`#UM
eqL5k<d>JKdDW>2Uhc(]AA.,t)`If<anR!0J0]A2"BEeX_#9>+?9G8V]AF(XcC_fB)[a.2iaTR8
0BX[U>9E]AL;idU'4o(]A14QqrtM&S7[cEg,@7^[i[?50k686ZE@jcHG>=;09*Hh@dC4EP8aQU
YNA4AF77hZBA_fjkW(N8I#:41ieBP#[UukI[A;UG0#o==lsGGf[U*o*2NGm#2'+1gFrVtRFZ
eunA0ua3]A\=U=AB_E;Knf>UDq\cXfO]AUM+.4sl7Blc3lA'P*81AXUr^;Z#"lp`+.eGu92]A7`
1#F3<l_:S2r#euhk(Xcga#]AS]A4@0PE8Q@jbOGAZR]A48>c$rI9o6Yd72KbjE]A#cl^j5=0J3t=
t54Sn&>tXJpWI*&M:0[s8?.nSnT'U<iauirI4~
]]></IM>
</FRImage>
</Background>
<Alpha alpha="1.0"/>
</Border>
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="2">
<FRImage fm="png">
<IM>
<![CDATA[m<IeQ*74C;Om"ZY&knAuU:2OZe<$WH.+)h[M)&8AM'+'I7'ro?LT&US&V?sVNR!4)b96YK0l
QKns2=fnpYkI]Af!EZUHgQ7,HM6%<HQrW03bhE)&eYhgB0)L$,UB2Ps7VG:jSs%<kT<D0P'b?
t1tBCX3W$?d7c9]AC"+A46b_^aC:FT8Ng<M-[3K$."4mtCh"IA.V)ANEJ;cCsol,as(#iGOYn
:R3RS%BT25rl%PrJY>YSAMJ;]APOXS<uiGA4/O#5kH?pu7e`CMQTMKCY_d8C$O,a_*HUiqc]A$
u,FaKdEo.N]A_;Gfi[qMaf.:F>UphK'd*5J2t%3dLts3tA>djF//`BY=Y;rK\c\&XWr,GI9DL
[,3*05UlChKmu!J4;6jr]A21H0^".mQ(*#JH$c(;oK09mS98k+QM&)/\Us]A%D4'oRp:I7:Zot
[Wp/T[#9_e_(%e>T]AelQf-Y"27QLj5N8[j-,Y6i6LA/Y#Y>DGb!fpZfXo(N\lcoRP+&rgF)d
>h44->n%8Km/1uS[_Wb5i`KK4f,k_jr*RB'MEVQADL]A"eEjasdk.luk,#laHAn[KWM?]A%j.[
//M&@"GnEOa85C)?P-Xj7OrcO?`1Af?%Ys.4gp8l?3up83b$BA?+B?a+%"&d!Qafm_5l,f;7
/EE$-)jj;AB?a/"(V0.>>>Y6:h3*4Yg[#hO&qcAcX^o#&,dg^E7CI$?IW`iQ<0de='T?0CSS
/nHc>mr$:k@_PDp2d9J1i"(*0f:>uj,#kG'YP=\[OuK8&^U(s?l.B+]Ai4'+kO[l(1:J)]A\28
Fa;_"Z7*N#9S:hr\j7;774*Q&f.lV:jJh2rZCf<L7o/.p'^@XGU)]A_QqD4+65H*0,R$Y-ao6
.b]Al5meHNp#@Qh\E$mKV0^6.9^6r4625@lXi/T!3;eLL2Q\K(d/JA18Himnpla'4$PMYnK@e
CqA/;_1[#NY5-:B$aD_8uN3U8s[R:MeYnQc)QbnG@/$joY&@Ko!MIjRo5>iXq>.`%j-#'J+l
`=^+*PD>p\Z[O&PO)83,3Was/WZ'^38P\tElu!=L:4m)8/=GGU@LQ<AEXTj9F,A>Q9WfbfY3
d6j2kJ8\GPlN:>hhCADnhD>P+9:-OV\0'RXOU;'=5rqsnB=0SQ`O4IK`RQ"H$#bgYU$Lc*7&
7UOGu/_<'Fa*d)priJai)BW-I<7&gt3^DTaaXV%Acq$eX[k%f=dEu0G.QlI[S>el]AbH/l]Ad7
FoQJ(t_VuH+=Na#)]Ap5:6Y_t-;WGgT3@77JX/u_PJ0:T+I%e=CmhY*K2kj%mCk@Z-N9rI?iU
i)`dQe'k/!ot:J*toG9?KNbc*WWLG]A:urq-Bc"E^F+<=89m$tPc!'&lO2Gb$Dr;/0B'1e/bo
f2aJ;j^^eA8+KR-F&<fqX'!pX,#=5SUu0hT.aUuE0AKf./O9_H]A,!l,bp+[OTQ>NLdY]A(UtB
hjK/WB?*2O9oTq/4R?OH?ofL^$f8E;-h:Gp,@(?^K+AW]AJ&T<oGt?*&p"923V/$RU+;;qD-e
R'-7l62d+k1Jb^./=_+SMfL*:Qgb?gqi?/ha7\rn84g`rc#[+N+cXD^=m%D1%++@Jp!Yh$4k
-+2Zio<!V=X3AP08[TeQTN#`8a37&mK95X2^n&1GX[7r2l("1[p5N\NI6kZN&OOs?O`EkJoq
=]Ao,[J]AltS(a9Wa;W_84%_GU%_0l7=Gg(d?/`#Iq!5tu5P@cHG9>MLRE?&u(B?44\MYFuf4V
r.@@f%A^b6b`S5o5TU&(_'"'PXep6!PG3^*FIq9l#oq$(<6a&(cX`t0Hjh#1]AOcMMkI0k!K'
]A08A"m?e?@M!mGG>+!I4%Ot8`6h?<jLX43&0q(Mo\Nk!sZ[fqO:+90K>"4&]A>?@:t3]AX1MlC
C>gn&MpTU9c6<]A-T+^_g#,\G4C[ERb`ZbN+SH%QslBV,/kb\I,H?Ig,n-5HR3-$jbi@H9EVT
FPMH2H58of>!8^:Z*D5CA^DR?g:'LmV*ocilO/"XJOE^:Q%`jmR0pfYJnXJl9fe6ErXf]Ai?.
MVS;[F;<eO`a;),?$l2]A=,C,[UtWclW6$8=pb"/!F(#Qn_qI?=7QY]AGTWkfPXZa$r=.PYQr,
2Hf&,(F,N'u557YK('!-=0!QR#!LU[;F;$*<=8`3p:7C'&b4WO?MPHrY1%&4LT&:aQTqQMRO
FCp88)%iGJ$RR>M.1X<lKPl4//r72VF$KsDbP\==(aRuE-1.H%M=_j?D"L1\nA:\S,@Zhh7X
JcscE)/lMU9Bgr#?mk7SZO/:3<&2>Y939=jODk4uUZm8B>6W=3,8+1FKr1A5YM+;]A_9C2^!Q
J`/!6rZ[1&<h(l#7AY<%jSIFLr8^j/ulXDmmD^p(sH_'G^*s)ZNH*RCW7Mi.nbN)p,FYVZ&b
@LZ9,<;U['oUfSJ#gK[1gHSD3G23!T(cH@OhBr=AB.;\Kp#llU6sSLRW$MT/CO#&?gWlV#FC
GL5WD.nX*oLKf@G+7q8J"#m'[P?YKu1&gK3pGYIfhjL/XbgHY:Ng/2\1pp5qNY'slqi4ZU$;
44(`56pcGJi=N[c^FQh("EuOb(Mk%J]At(ZqhYhdqU<AsGcFc<3ZO6;Fn+.g5_(bYK8rDY$_(
88?,BQANT_%pBGQ:fZ8iQWIJdj$D:Po`@-"ZqqNDTP#+?j"ns3UOHKj0^i:i%1$D\ofD'A;a
r0>q^mmn796+/)]As]A&L+a[ddtc1FS'Bj@pKq?\q:B[/FpKFRd<r?4rD`SqeXIO)NI0OF//o,
pR]AqGX=Tao&qfC/loqM.$fN3394D>TCP8"EA,e[J^,?FpE#WlPiV>0lWoeV4J7ao;1aIS<q/
EJ+o-W$OT*jiC)71J!W2o5rs/T("XhePlm!aM.bfN<?Z4^nT_0;X?o+jLl+kD2S=#m1r&Q7%
nl"K=Z?L-p!sU)>es'kf=V1C@4)2PkjLV;0n#7_?>NY&#hce-qN+5cg#=.rs+KQZpF#cN?"u
O4e,msr^Xhb]A%3/NIgD0]A_o\CL%Q15lkD(Zs+`.Or[4c(t[L=8+R;CuMW:HQSO;,0r2ACg0[
8rZM+b(D,ik_e%$FI^Q`-rT'?1H#,giY8WG%R_(YlS;14Z&>5h;Jc\/)lpct_UB7NLP=)4lU
lethLR!(,GG,r)b-JTRkhP6h;r;#[A+"aXmCVM-+s>G^Aq9Z^^ntj2dZ3ptg8K3;*K&3UmAn
'1\9^Bj\,76*>Y%:3gq`%c"ad(+,hu4G#=F2'KV6TU+euK:TslINKNuD64TFRAVET5V>D:1W
5n-Jn8dMd;0&KX(#K_L6Gp!O[Cp*lnYAp<,LY\LhGOKZiJI7sPDalJ%\/b#G^]A+#j!MRe_Ml
5Y-^bGod*\`0?4pcCu^:+P7j#OO?`.e[O+_*]A!OX=YJa)WX;*j\K]A&$_c?8lCt7AVYS(rtPm
Q"H_1f?Yrt_>cU/_LL$sZ#BZV=$+lmQ1Y5Db?k.G!#e[M^`t-eg_7@aK8oKupb,d?5qs!p)n
_o8rY7UbrI$DmHl7]A8Gbrn65\dU6jWB?Z\D`_t5=npr)`=B1e3M.$$]A.9J'[__$K-n"/cUXd
>sG@&TI+c#EF_%aeI6SV(9Ro?)-*TOnR@Yr((537D/GBAa>_cP2n2F/)VIfZD4)fg#=7hl*s
?Ag>N7MB$-7+,ogXa2-#7!kab!`(U+3CG.o(7Y@\o>,l;J*nUWp9/]A6/g8:&&&G_g%B^S]A+N
uSo"PH6ro-JLnb;d5*e1,:`WM^[HU\6S:D+Db>pa_,Jqu0?gWHJ":'X4-8mL^J5o))ko)M.\
Lb!9K4(?hnhF7g0QV<2@GQT$E,]A9bQA>f9f$!)AbBs)b8H&"N0k8XW&%%!0]AJ?rJ0NaXhMj$
:?BgB+A0Y.;0/C=p=*4/mZ\0HWO>^H,S6o$5QFRQ\!QA5:e(]A=V)gJ1SQtL_7o:B6:)9XFp8
/Zl(9uV8R.TBi?Kfm<ALms#tJ7IfQ//#&_c&"<,UH\b.C-1gZ[A)jKOSVU_?u!8AFCuTBTh'
/0T;ZV]ABW]AbE,!eM2PNK*^Hg8pB"mQSEng%/;QH[1lBqnW2E:pT5E?QcA&)=cLs/[W]A1aL<g
DQtA2WrAZY>SO8Q#WJ5d2Hl'8.O-K+uA@NQ<bV$:QL5(n`>b`9k1PWr[$TkI.Ii%%ZV-9)TQ
d5Z6j8dkc9De:KBCHS1pfpMIKpDE#m_FYM?2e(6ga"QmE/Pq@(pfNB;Zgnj:SV42V'q&qYJL
Ve')-LEZ.<4^3lm:=)lm@:=2;O/@U`bd'BJr9@,6,&Vo<oXCm8pMh\^1`#RfJ';p>#nhf`lk
\*-1Aru]A%q4#+j[Y8[7Bd*EBCW7j:j!VD;4E#liFn)6Hg#q(#u<C4H2-)Dr-:b$E\$U;FklW
Th$#F"W7#4,>rd`O^)HYellFFf!<4ID?Bd2DQWd\8pu+RXYO)TeTnLWK*pT;q$[;$'bNd9%R
P^4^kDWS?\7>6QQ'2n*EU>X?'!,ZhRaEPY4Ke=ooiErqG_[:BVK+qgq0d4)#GJj?0"%6=+V@
i8AgI#lRYhC1H2He=YSB+T8)6#Zt=$>IaK)/8'uIMQ3kMickJPh%LQ]A*l2[@5U6b0F`?OkRC
O_7H<lHP:c$"W1B`IV@7r!3qB\=2a\m)ZuSu^>(>ADifYk!M*VUaHd`a@6CE'p_['U)WLHu/
D8[2.huZt+fIk'`MsHQej]A>Ri*VZgnd,K^du0"To,*T*QtG#L&goF.Yj.LZW28qc]A#dG]A&`=
a?<9N1hcA6l=D-R'VWMWDJGP_BUKbY8c&,GShp-TqE'utB7R^GN4sL8o3kr999`)J6HCb2<,
sfocpjl/Btfp>$m!/N-HU-^T5;Z#EWtUN6B_Cr]A?8bN1+Gua&TRUr2"lGp+B]AI\[(XM&<LiO
6Hn/V-:T1=]A5=XrbcN6"hmFmnk8;+dmTq0.qkQn]A<r^CAi;9oCr(U:djA6En3-.^Z3KMAiqH
#iQ>-YtcW[Sbh9c(_G[r$f1M'k;NhX=?3KKZlYYI=7]Aa61M"J?b^5kJ,;Tu%>Ua<XUnULS2R
Hm@I6atJ(""-!hbSkh06Z*cF*fQ]A1T9A8J&!'o"'nsKD%O\c_"#5kl.n'A9,^b6^?%`l4IA^
39E&n^(\pT;4/_T>N17uZ"X8DGKLF4F=Is!Ma,,t[86MQ;X2R+a0XVj<I4]A2,$S1:("p@GgL
&tg"#g_8<.#E9h7^>AIR0/`:[GPK%Km6+k&.@]AnnT3nGk[+>D_2[Fa2h8a2V#\4;(*'*c[f1
bYmQfTJ<u)%eX()!4[/[M(Gdr98c&A>9,8H>WJ-Suo]A\gYBX2$%#lW2c,j[/F>E()*Pu(/BQ
.SCmBHZ0@<f3\DVb9f'g>i$W^Vg1V_osZ^,ROZ<gc>3[=(Keg#s,![GH4"c(Wtmfr?3&>pQ"
NTD4Xj/AuX0h2VO[4PZh6KLQn6o"cLdnA`A2'IV@V\9F\7%oB@eJrRV'Z=!`2G*:Q+/Gb1/H
eC)"<+.a*WdSY36-BV^AS#2mna>LQ?J^b.MA%F7LKhj`/W=EB00H=Hlhq&"p_jjpbjfQ4`qu
!76i_6SE4JDEE0hQ,jaXHt+cSdSK]A8>Go3j2>qgT'8Ff^(BQq#2Bpo0'Up'$6;\MM?;Q+3B'
\."Ff!qBK=598m0fC:73r"a98J@mW=L$FcmZNa\>_]A`'_[*cUH#9KVmM2T*<$qieHM@rq;$:
GQV?Pu.__r@?jnk2FRr\F%$lpfjUO0tI<unX8&K2(5TK-)[TRfrpjlFS!^Gbb1#iC;=:^h9j
g?kI:I&bY>d3N2VjijM\Dko_#j!)?d*h"6ssuQ-R7c'U(Y'5lhL'nI'fud2\5ugJ'(tA=;=<
Ttc9M>W-KSd`p,^Jn-UCm(s!rM2EfhZ,qIfkGNTgH)HaX%PR5b*Z`kP[N,pjF-:-^jeHI;kF
ITT\+j4C2J''&X?oht-Og+(K-+tRHZ;W9CnaoMe'/S!T"-j]A5Ad=EmTIReAXn'obbu0QB]A=d
::c%bMO#<l_[`LG,_(@22c@7uWV,$W"/t="?F^:Bum"+J,f<fs&&VT<Nn5VaiE_mo3<p1&'%
2&Mi\0"G*0lhG<c#%>0oP3@ar6*938G79<,g^@e7<`sq[]AJ0f2:p=\PO8$IpKX:rp4*^G=(p
bDPZ:3ZQ'IX$e%F=5OumMaORo$OnXUDFLS*-VGTSE0g/9CjcVS`Ve'1l1MS10p>]AXepciqLn
F(<"p>Xp[:[-oCWXtkLJEb9G/Cir2&O;WEK,'s[mI9nmh,Y5SM>A?j.&@$SfF,P^)";`@q)N
=3DHp^M85P?2".Z(c/CL^/-=Q7%\nn7j_@mXG+[!hbJ55Tgc>VP'!Ia8,GFljK'jH(aj2DFj
d0b'NubTRnmZ;qN<,<JANm\H$i+-#J/b!Uld_fG>2%c<.hj:'k=p$=Y-Ccfn3[C9pnfh89Tk
lATsUS<Ub_K,Yo69T$07cEBYS\JNZfOJWG)K/Sfi+=(@D4\DoH/33O)Ie'UEI"!BTeN]Aq'`2
\K*NTr+.-'26I($er!HKa%ME/tM;4@k2;t`ZLb^/:[[%S?!6usf3DS5mZjcj;W:5#_af@fBL
Hpl:EYI\B='p76OdU-?c`j>X/S8%b3f:77;)+LCD]ASeWi7F96q0tf/.$NIcQEDEr!+nb*B6/
/oVP9K(ApJ^kRGa'BU>`GGgFN(khI\ce=K+N.GD7Ou*@^'PN/@VNnn/n&B8+&2WbG,`<If,8
)D5RECkOmFd`ASIIal#uJf3LHApid\0)BmK2ZH[GE3Hk5*#2$0^l+ARTpn8d!X.h2,3"Pi49
o-O#FT.+n\;L.uNof[hQ0`C&OY!S<Q))7#D3,nS9+>),FP^'#ZY#0P<hVNfV9ES`"+*VNMDE
Ljr'\Nq\0fiU>p>pZ<b*%:m%Gud>E%)W/AWU#YYTiPW@sKc7oM?fW]ABRrhtDI3B1CKYnV/4D
^t#0&KIHYIL0@gE:[DKd2Cr9!;lSYaN,1;98%k-,R/)hSfOgA"fKlisOkj4*,@31%2_Kj3kU
p7m,j)[G6X6NLp1b)mG-IO&$<K(i\-8u5@5D?N-Mh#^JE'mKhD:(ulVV;CN=:\YiinE9)K;%
Z2?Fm1>$'jg^XDZIeu`<;]A&;pY!$E?)A4L5:2*4;,=5XEP[,jI:-MZ<j+CkOcgCI=H=&k>VK
YMQCUg7mWb\H&4)g'1T')So?;UY2H/0E]A2`]AEJ3.rd);E&VT+XWKP25]A9VEB8t-k+EgggQW&
&"c\k<@8MXV1/VQ^;9-%iOe2@>i`5sW]A:lc!B"OZ'K88uNo[p>-o$2(;/PAS*h4dDL?NGNK7
Xj<aViJ>sT<Upm[U_@[gDA!;F^QPN=e<*O.@ABG^mr:LbC0^38``N/<2==p]Ap:TIreL0cjjG
D53TO=j#%.\jO_\(WJl7-_Z`V]A;m#tgfZ>M-Uj4-U<`hF/9eTCqjHWEt]A'0_@t\0d#_lI<MC
p7E7;=R7Pa,iH5Uqi\sTZ>.?\2iG;l59KF.J,2q7qEDl;>@@q0KI43rt9aA>Lj_k*0Nc/51^
L.Qc;5)&QZK_,,kaVB*ds#+@)FPGIr1=2'-pBW(5&r\%il[,Vc=e*n`1dfI.`fNRo*FiZ=^X
[l$d(P)PK/`JV_?=cn(?9oYbDbk/=uJ==!.D1*"DcAW'io4c/C"(p>/B,Jk"Du#-M`Eg=V)J
@VN<b;00A3BNcIG:u!SSo=N]Aj8;g`L_fgRTib[\8%7Fft(%?Rb'&P7nl1#,pao-$kSN?N%L3
q/4?O#E\)*5F,2(=r\^Mrp'r^lMeNu!Xe!scc(CE(>X[!e#ocA==5rY)ANnD*\caX:DpcX8q
no^pZ'*KL/6^(]A8[/p'[_WR&[HnKk[-B0#lj&VI`1e%I!@N0S:qP`uR[3pT!IqHY'u1cJ[%k
%0'h0(hA$2T>;&Y#spSQg<t6S7_=TE^&!8/.Lm`S/&8#,IMf*k',0gPsn6Ini,3f'.,?uCNd
k?4Y14orO]A+mWU;m_X]A'Q)Im9UWJ^%ea?0dNpe'o653_`s/0%7Qn:J=.:,)+jF(CuOlNNJ8W
r@d>Eg:f#s$:@8j(i4Yf#`Gg9>hI=L>W0pJ=kV(G9f&`W2)=AC9\JDkU0m/%`3^9a[kojp[e
V_6"uJ)gi?+(c^qEoX$9$qa#3N?/"nX\`?%g2G-%iD8`ifUL?MIPk_csq4i50Ha&Jr.R9<#@
SbBm9@eX<-sfLN2iUZgunO(,;Y%5YkQhPetkTRA!V/Wpu\Y6H)q+P.UkD^RRC=0hbia#:rO(
u1P%qG$aEpJ)%inQIWo)*;6B[qcSX-jPZ3HprG)GLeVbm7T:FG`H0F4@\g#SVKGq>DK1tr^@
Nk-tJZ_jll/D/gg!smNk?'\<8T.%bseGaI>oia@dAXf#A2'k[O4d[%@]ATnFr_R=7Aoac!pn`
b\!q_3,<Cbb9HeYc26e,.`YMoiB,777(D`7haZT%Y8W++,$<go<r09bbX"iC'a`40K!R=obN
qXG`]A/N`ccQ'aq/=XA;b9jQ(tY?IkZ6IpRJ:T3DWb?=qhcL[4b"CBq*A1IeZ[;E<kA,%c?P^
LRqG3*gdhn,PHHc50g#cDmeT!V</LN`lMCDLF,s60YoVP8^C%87G@RX&?BeKnUm>-umgER6Z
p6.RS&E,>%K#42`UH3us3f..!OuMq1-/e&,;`W)8X2+ob0ik7.5gR2`%6#1m`H&o_fP>O&ln
_@8cWrTr.TA4\s']A2$f0Df\Rj`5pl$ZF(t>,L:AIs9]AKp%5k-hfS`^_2snqGdjY%g/bMTU^L
4f2WBG`VH!?'4_J8s0-eSVLZcl'KdF+eK"(,BAOt<@btP<P2fqjuG@Nm#_s+q*"?!EbZiOG+
YeGj$6P-qM1n$>9e5pcMG&i;V))FAFS-U_!'NKaDLPG=c(&2cF$s[er/jX9MMfhg@E\a!+)W
M/ck4Zb.*+^kBmE)>EO?6`Fe@.E)W)l$^7:ZJZ3rc@6"6mRPcL>;]AVSLX9oPG2S>Zja04*Ao
imjDpp[PpK!RLo4tTk\Hf!hiQ2lj78)Gh2*D@jJoDEEI/_:5dm2nVs8"0Eh>j2QI$)Rr[&f!
hKF?;OlI!bsURBl6o4>#-ej>S\XV7;0#Z/)mW#+.5!r1Z>ZNE_'=37<;DE.;:FV3d3^I%U:p
=&[/%Osur-o:<\A:LAMpSUGr4;<s9CBOD`"H3H((;([`bX8cC6$V'Jk)WVm_L&#dihu\]A/HT
7$G&OG4<X8-(%N4C\,,#%3Ea*,XpqDlo>BHJr]Ak\[bc>(!*gNPF=:O"&+9[VQ30QE;4L's&V
mGoC3r&)#u(6[c-I(aHEQPPl^9-@-8O/)j2@"V9[qp+Ka;9H5W]AT>u1o>-+AF`TL^KJO`#UM
eqL5k<d>JKdDW>2Uhc(]AA.,t)`If<anR!0J0]A2"BEeX_#9>+?9G8V]AF(XcC_fB)[a.2iaTR8
0BX[U>9E]AL;idU'4o(]A14QqrtM&S7[cEg,@7^[i[?50k686ZE@jcHG>=;09*Hh@dC4EP8aQU
YNA4AF77hZBA_fjkW(N8I#:41ieBP#[UukI[A;UG0#o==lsGGf[U*o*2NGm#2'+1gFrVtRFZ
eunA0ua3]A\=U=AB_E;Knf>UDq\cXfO]AUM+.4sl7Blc3lA'P*81AXUr^;Z#"lp`+.eGu92]A7`
1#F3<l_:S2r#euhk(Xcga#]AS]A4@0PE8Q@jbOGAZR]A48>c$rI9o6Yd72KbjE]A#cl^j5=0J3t=
t54Sn&>tXJpWI*&M:0[s8?.nSnT'U<iauirI4~
]]></IM>
</FRImage>
</Background>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[288000,1008000,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[152400,4000500,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="1" s="0">
<O>
<![CDATA[回款同比分析]]></O>
<PrivilegeControl/>
<Expand/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList>
<Style horizontal_alignment="2" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="104" foreground="-526345"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m94pC'3DcBl`Oo$d&UBY)b@TJcHiOA.Z-"b'<TuiX,`h,QJ)rde>eFo6p:YYBieAnod6ML6"
Mn?Xie4U;,CB;7ooF&;hVY)#kFfc+@6?b5TnsjKDL@b1\[5:DuZO,1NV^&RHK!jkC)3.-=m;
%Sb2KR07.ti9j7M9Q(,G!`^!j:^LE-@9E!<SnSb+f=)cgWQ-6YT@tpk_kQ`,B+$H^IX=gPKC
!(*Mh"UAh).T*scULt%M>H]A*Z.hIE)#%3kL&A&T\`h?WTCE`cqSMm\CH[8/Z7!B(.OCX6U=s
]AeYB$U;`7OkU:U8S$c`OCrm&9@0@p:4hJ'BlQ+5P6dq[>Ol\A$YEqA8GSB*ZPU'(C`2LYm6;
.#$&OB:o!P]A&!oMO==3po>f2e#^VGcguQ;9pMU^K*bi5f?"e-!MT+^YR.e6gp,.$aZWfi$"S
JCs<k5]A0*OPT:B'&F9>U;+dEU3$_kL_C7&lngP:k*o#l*kgQF^>#8cm<P>EQ_;s(+<Os6<W>
XqX"(@ku2X!_^b-CgjP32U&NTb41YetM)BJuY+?q<S@E]Ag\%.5=@]ACp!XQm4lH`.0U<3HVn&
$m03U7dnM'B_6"F5P:-[s!ptJX^BaN/G+$q[H\_F\OQ\SS@uHnaPke!Q2*C[]A;3$[q`<<J*h
9P@5W*PmlY[c$%m[[c<k7Ef4o5c4&F,#r1FeIYD=tI1T@?CCfkM?F^!),PM^&&O@lQ/c<!uI
Q+W<epuGT&]A;.//=td[![!Bt0p)GOZ;:&e"C1ZlAVFJMP$m.#J8cp3(@M/bMP'g/MHZts_pG
umTAjuR!Y+X$\,km'IakFksaV;JgZVCl3U)XK?XD4J?QSZ`cF%ilTn"Qr,H4$(rj[0:m(N.M
\@Cp*-$!sBc+;;fXoS]Afjb-e#U"_(i.>S6['jF^M^B?G9k;-;W5mpJD<4.4"76AWn%eRsWu8
OkW?.d&IT4Y0BF="j>9knr)$-1-a5p(fEnHq)&Z"m*dI@H$R&n5GDcCjq\<2\E/55(CC1apW
[F**aKm9'7G4AbBreSk+6p1Ept2[!Y1$qIB)dDpJkgoN39.!gQ2%#?HhsE/i5Yb5"uK1XZ;B
+'RleLp`M"%b5E+?/N4i_88=m>+,/1D_XJ$`1(B^BWUc',*E,>`'Q+;;gS8EGMQUNJifL$lq
78:q1+#iP7gq39+r>Z6F'(l1l32kp1BF/o]A.=OU5Cs&/5%:mcsZ%YN@sXGA3J9/]Aol<!A0;5
]A6C64h1pet6)O,9U)eP746@3W:YG&eErR$i3Xg$>J(jUNtYGJtRrpD)F`7ot[X";esNX;]A;8
u#@39?.u6G`Z?Fpe"0h&_`8gL^E=/cK/IZ?6e`^+u1]ADBC-nMFr'[E]APYW<Og@o!)`-.0OA'
hR9=Ab0?KDk^qM7\![ajs<@->N_Gfa0W>9UOdM-*deB8hqA/\'NBgiRj9gDsP4%qd*O1$sTE
3J&St"T;)*5cZM[:d.?q:Nt/@YZ^C:OaKs%d!RWInAZDMBJ"FoD!>?.g#s-b(FkhLf2-ieYO
mHH^5;n8WW*bs-r+X%.m4&S43dJa@itX!I2uR"`?5g$4H2qp93m`e2W&iP4r8Q=Os?RsEk(#
:`0PuR4`Us`,Jtt[>UOp\fg4KiP_'Yo)<"8F/E7,XO3$k9rfD-a>'9t%-,*sJ8q(*2f^c1Mk
$Ut+i0;h-?^u36[]A<\:)Io0[p%p-Lf45JS1nP$XXGDaT`%@m>S+rl1'(,S+\q>'#Q1XDB:"i
IF053;b*u+!KlTd'g/EJ![O7Go09)%-``0hU0)2Z+XaZXFcb7o!s=[A__PH=t/V4E[_e\.uu
2C=]AIU+KQ>gbP@cWES(gQSVXA.)UArZL7F*Wap4hou\tV,"K@$Pe?G4[%%qS,onq^Li\-;$#
)A9qDR<h,]A]A/Dl@aL'Vr?om8&MZS>n#jlj?'6I14@j#^%M^*ef,6<_3pcQYOB*J(NfBpY3K4
H-D\ZqC`C$`RamGY45D9HF:d0'Q<LUXob0*FHqE[(AP"i2kb0e)MgbE6*_at'ja`=o;o%;Oc
;dB@>$d>/G$N?sl3d=/%l.`,#BsR@>`jdM*4G><MrP=3BG3!.G:n)BN7N&T<9=a$+_Y]A8r`o
=/kE8_To]AM[$+sT<6mQlj&Tc<M5oYq'["qG:L8OjVdqtk=YFBE)n@nB[Kh%Q%FAP\$Ne^tr(
<5K,l8c\C`FG3(80<d7`a2MMAaq5MZ*eH<),)!U$,A.)rZ7M:Z9hpg4<?tFR/0)mGX<QVLEX
\AN@SZHc]A5!9.qZPWg%?9G%=aK4<)dgt';5'3>@F=]AZi=D`gYE%2gq?@T?fdj-$(u?7=^6*?
>Dj57SDkuS,M=5U$dKfOd9_(?G58%FS*<_^FlE3Yg(!]A/q]AG-8]A2K;($"h!YhB0=T..S@&?]A
:J7KGIG-.@<c.rJ/FVCQ@sF+q[D%^pJQ(o>B`,>c`QC]A9I:qs]ADg[GQChI,2iPf^#1VT)jJ[
P>g'?(=FT4qI`?VUX/Y>W]AjPmb1,AKl+#o:'Pq'5]A^4Mll"6L!!#eLPMjZIoalDg]AJD0:h>c
cT)c`rdg]AToQb3!Essnl`RR]A.'&q0lcBXH#GAKQlA%_O))#$#Ai;=NIGn_K20WY/G$<&[_'s
@:Ta2]A:MDf:@$,p7GA\LE2TTRLEfK\634DLnT?1>Nm/4JNQ*-/^AD,pHh@$;?NL$*A>2jXf0
Bn$U!F2q:cC4snpt2hfEhL+>JKS"FWW]A.C>$S*;#Nkb0"mK;U41!3e!I,$QtUVp5q]A(ZFCIl
2]AarV6t/U"t&Vrb2=G-"'Y+t'4?<PK;*RGVa[7)Q*QSuqk_3b_/'XD.2mA\W8?LB<2Zk.%+#
O6`_d>Sm\-#)RS//c$UM]A/hk6Xsm0;Bp6<aTR`t(RP?ArD-0`JM=++c2C^tobb*ENd$H-5!f
\GgCWX!YEYLEFHN"%gOkNt?!_:h.r@HJ&*`:=AU'ZqrQ3qa1Me4hTB<^^i['-pi"mljWK"^I
T_LF_&o'&>2DeAtHegQ=ra.kPggX3mh%!'rYLak_sPC\E<=sFWsM,puco:B]A/h-RA.KgN3B4
dV*&lF\+4laNq[_/qnie^!`8#AY,51PVsP1h*]Au]A_ABmQrV;=^*7:N3TWFjh(0*RXA/u<O7i
`CST7R+."#fJga[a5MaW;pY;`sMWj!t4Pg+7HP8_`1Sd7-b\q`#itHd+*PV5'Gjk5<UY0ip,
m@RQc4o9\&X=V4SRhQLURPM'qj?m_u'_+Kn&\SPHEdm!*8KEpEc*Z^6imZ(kA1pJ>mdLssU'
"UGShA2#M)HVG=5X98;k#*nro@&r5K&3`:4fi#"PXWen_AUMs#OJ9L76go#Up-2drhY+guZV
%5Z_ctj_l3@nX(O'BJ1gHU@0n]A-7>3)+QXCA;r9D=`^@cV/eL!#rgc<'naab\Uc!N`b#$#L4
^G`NYJ[t"QF1r/njdeH/rGKN^R=N,=IGB/3BhS3ZT!R^NVSu@i@A=-09:.`q6.Zaj@SLmc.G
i-_@Vi>FK$V$$lTVaAGdNAYcl;F^fD13=@_Rm=(.ue%AQ\ZCABPsTrEJ6F%@>]AoMno"M^IT5
hkfpH'XIu+Z4K5-@RZ,08&pDn]A_$msLI\6lTPo`7eYggeU)@U7osiOOiD5c$&KOCi,P7:'T?
.;f-"XE^hEmDOpl0NTq&6#hOknoW)<odLuD$]A.hJQhKK:i]A2mQ&=ZnO&U-Fb5Sq*:0c%'r1F
eKXO:5Z&CmGWJSE3nn)#,H,:<L+X"0Q/^2H@s*'$AEWV9pqOT?@ZY#Vnkp*!JJPf//q2LW#'
)f%U9k;H>_T<-+pBU(ta8K?$%nPX6<85/9?naO):":XNU1_'#$nYE+QX9*S?=YftS^@tcZVO
;P'1iPf)Ar]A6.Y38OMD9T]AQr&j(hkSRW#^Vj("(DJK8LR6-6]A1gUthl8$)HP<7@0nO?h2.(s
dG(_*V)U7p/a44(L/f%T&,7CpKWef7jdRLCiZ5^@+RWV\->iq*2S[6b%0[I^$FE4$kd(D$*W
*ej^cAF;UW>g]A>`DnTc`Q+GOG^o"'n7[eYg?/_5K*N5BEKrl"Y`QiNd*0sV<(WOYA&CQ90mN
k/CRtT(^p\W#GJY%!i<4V<%+0="`JnZ-[`9(sqec6?jjQYTMi0FEodAMtE"3M_^Jh/`^jBMZ
nP(Rd-TAS2&pNXaFG=bnF6KWCY:P":Bm4]A/s$qBuDjZ,==F;$MV((rsUZ3I*5/k0:P6F1e"g
egATf#J"\Z6I1.J1S(sZ_cYJZ1[O-_(hUhO^O,9/'tdi%OT\'CH`+M58&%)$=u7HPT`D*[)+
D$4bU8KpE?(,+c)'Z]A"/+8Y/E]AM_=0sIK:2FDo/c7[P5o<"M-LYO]At+L)A,pb*6LI0F#leC-
m\PY/^i#67ae3cDf$%Y^n@\K$'2nC^In(aZOj[!G-;^M;ki[n^?+-Mh5J\"5kiHpNI-&_CE9
U5g[LPr08SAf4A4F*nPJQ(.&AqVnW&>XJ]A+h]AM:8(o>E)+)c/]ACcg(No[@e.jQU12%B-Ms6:
Xa+F"l..:"u)F+`V7A6gFNm_iLJ__T'2Oh_bM6;b.pq7moW\DjuljrZ^nQKc`aHe$&j&3DNI
`5t:=CG9i4doAGUMY0,hVBNsDmFk_arZPnLObGg&@BUK[F;u79hZhp+I4_MLY4NP=jUl2PFC
%X]AM@IZm*A/?d6.@%BKiU2I)n]AqPJR+U!7(op=YL$Xh`r;]Ak_0gQVfLC>43,Jegh11V(Md]AF
.K)&\S+LfOl5(u:M3Zmm7c?0*(J-fj.k6e_*<TK@C4AbjSu89U2Pms>BM8lS;Uk/XRA++;TU
_YER1.lFTf<r<VXqU3eEap7/::CKW7]A]ANHh%>YS!bmng:HC8Z8cD:IoAl]Af6N7JAblmuQ#-q
SdiZ]A0j!=+53"&1;7gH7f2W/q:5*^OYGFFS7g"0Q[DtPT%je]AGprUiA~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="250" height="150"/>
</Widget>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[723900,723900,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList/>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList/>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="652" y="13" width="203" height="195"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="report7_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report7_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="宋体" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="2">
<FRImage fm="png">
<IM>
<![CDATA[m<IeQ*74C;Om"ZY&knAuU:2OZe<$WH.+)h[M)&8AM'+'I7'ro?LT&US&V?sVNR!4)b96YK0l
QKns2=fnpYkI]Af!EZUHgQ7,HM6%<HQrW03bhE)&eYhgB0)L$,UB2Ps7VG:jSs%<kT<D0P'b?
t1tBCX3W$?d7c9]AC"+A46b_^aC:FT8Ng<M-[3K$."4mtCh"IA.V)ANEJ;cCsol,as(#iGOYn
:R3RS%BT25rl%PrJY>YSAMJ;]APOXS<uiGA4/O#5kH?pu7e`CMQTMKCY_d8C$O,a_*HUiqc]A$
u,FaKdEo.N]A_;Gfi[qMaf.:F>UphK'd*5J2t%3dLts3tA>djF//`BY=Y;rK\c\&XWr,GI9DL
[,3*05UlChKmu!J4;6jr]A21H0^".mQ(*#JH$c(;oK09mS98k+QM&)/\Us]A%D4'oRp:I7:Zot
[Wp/T[#9_e_(%e>T]AelQf-Y"27QLj5N8[j-,Y6i6LA/Y#Y>DGb!fpZfXo(N\lcoRP+&rgF)d
>h44->n%8Km/1uS[_Wb5i`KK4f,k_jr*RB'MEVQADL]A"eEjasdk.luk,#laHAn[KWM?]A%j.[
//M&@"GnEOa85C)?P-Xj7OrcO?`1Af?%Ys.4gp8l?3up83b$BA?+B?a+%"&d!Qafm_5l,f;7
/EE$-)jj;AB?a/"(V0.>>>Y6:h3*4Yg[#hO&qcAcX^o#&,dg^E7CI$?IW`iQ<0de='T?0CSS
/nHc>mr$:k@_PDp2d9J1i"(*0f:>uj,#kG'YP=\[OuK8&^U(s?l.B+]Ai4'+kO[l(1:J)]A\28
Fa;_"Z7*N#9S:hr\j7;774*Q&f.lV:jJh2rZCf<L7o/.p'^@XGU)]A_QqD4+65H*0,R$Y-ao6
.b]Al5meHNp#@Qh\E$mKV0^6.9^6r4625@lXi/T!3;eLL2Q\K(d/JA18Himnpla'4$PMYnK@e
CqA/;_1[#NY5-:B$aD_8uN3U8s[R:MeYnQc)QbnG@/$joY&@Ko!MIjRo5>iXq>.`%j-#'J+l
`=^+*PD>p\Z[O&PO)83,3Was/WZ'^38P\tElu!=L:4m)8/=GGU@LQ<AEXTj9F,A>Q9WfbfY3
d6j2kJ8\GPlN:>hhCADnhD>P+9:-OV\0'RXOU;'=5rqsnB=0SQ`O4IK`RQ"H$#bgYU$Lc*7&
7UOGu/_<'Fa*d)priJai)BW-I<7&gt3^DTaaXV%Acq$eX[k%f=dEu0G.QlI[S>el]AbH/l]Ad7
FoQJ(t_VuH+=Na#)]Ap5:6Y_t-;WGgT3@77JX/u_PJ0:T+I%e=CmhY*K2kj%mCk@Z-N9rI?iU
i)`dQe'k/!ot:J*toG9?KNbc*WWLG]A:urq-Bc"E^F+<=89m$tPc!'&lO2Gb$Dr;/0B'1e/bo
f2aJ;j^^eA8+KR-F&<fqX'!pX,#=5SUu0hT.aUuE0AKf./O9_H]A,!l,bp+[OTQ>NLdY]A(UtB
hjK/WB?*2O9oTq/4R?OH?ofL^$f8E;-h:Gp,@(?^K+AW]AJ&T<oGt?*&p"923V/$RU+;;qD-e
R'-7l62d+k1Jb^./=_+SMfL*:Qgb?gqi?/ha7\rn84g`rc#[+N+cXD^=m%D1%++@Jp!Yh$4k
-+2Zio<!V=X3AP08[TeQTN#`8a37&mK95X2^n&1GX[7r2l("1[p5N\NI6kZN&OOs?O`EkJoq
=]Ao,[J]AltS(a9Wa;W_84%_GU%_0l7=Gg(d?/`#Iq!5tu5P@cHG9>MLRE?&u(B?44\MYFuf4V
r.@@f%A^b6b`S5o5TU&(_'"'PXep6!PG3^*FIq9l#oq$(<6a&(cX`t0Hjh#1]AOcMMkI0k!K'
]A08A"m?e?@M!mGG>+!I4%Ot8`6h?<jLX43&0q(Mo\Nk!sZ[fqO:+90K>"4&]A>?@:t3]AX1MlC
C>gn&MpTU9c6<]A-T+^_g#,\G4C[ERb`ZbN+SH%QslBV,/kb\I,H?Ig,n-5HR3-$jbi@H9EVT
FPMH2H58of>!8^:Z*D5CA^DR?g:'LmV*ocilO/"XJOE^:Q%`jmR0pfYJnXJl9fe6ErXf]Ai?.
MVS;[F;<eO`a;),?$l2]A=,C,[UtWclW6$8=pb"/!F(#Qn_qI?=7QY]AGTWkfPXZa$r=.PYQr,
2Hf&,(F,N'u557YK('!-=0!QR#!LU[;F;$*<=8`3p:7C'&b4WO?MPHrY1%&4LT&:aQTqQMRO
FCp88)%iGJ$RR>M.1X<lKPl4//r72VF$KsDbP\==(aRuE-1.H%M=_j?D"L1\nA:\S,@Zhh7X
JcscE)/lMU9Bgr#?mk7SZO/:3<&2>Y939=jODk4uUZm8B>6W=3,8+1FKr1A5YM+;]A_9C2^!Q
J`/!6rZ[1&<h(l#7AY<%jSIFLr8^j/ulXDmmD^p(sH_'G^*s)ZNH*RCW7Mi.nbN)p,FYVZ&b
@LZ9,<;U['oUfSJ#gK[1gHSD3G23!T(cH@OhBr=AB.;\Kp#llU6sSLRW$MT/CO#&?gWlV#FC
GL5WD.nX*oLKf@G+7q8J"#m'[P?YKu1&gK3pGYIfhjL/XbgHY:Ng/2\1pp5qNY'slqi4ZU$;
44(`56pcGJi=N[c^FQh("EuOb(Mk%J]At(ZqhYhdqU<AsGcFc<3ZO6;Fn+.g5_(bYK8rDY$_(
88?,BQANT_%pBGQ:fZ8iQWIJdj$D:Po`@-"ZqqNDTP#+?j"ns3UOHKj0^i:i%1$D\ofD'A;a
r0>q^mmn796+/)]As]A&L+a[ddtc1FS'Bj@pKq?\q:B[/FpKFRd<r?4rD`SqeXIO)NI0OF//o,
pR]AqGX=Tao&qfC/loqM.$fN3394D>TCP8"EA,e[J^,?FpE#WlPiV>0lWoeV4J7ao;1aIS<q/
EJ+o-W$OT*jiC)71J!W2o5rs/T("XhePlm!aM.bfN<?Z4^nT_0;X?o+jLl+kD2S=#m1r&Q7%
nl"K=Z?L-p!sU)>es'kf=V1C@4)2PkjLV;0n#7_?>NY&#hce-qN+5cg#=.rs+KQZpF#cN?"u
O4e,msr^Xhb]A%3/NIgD0]A_o\CL%Q15lkD(Zs+`.Or[4c(t[L=8+R;CuMW:HQSO;,0r2ACg0[
8rZM+b(D,ik_e%$FI^Q`-rT'?1H#,giY8WG%R_(YlS;14Z&>5h;Jc\/)lpct_UB7NLP=)4lU
lethLR!(,GG,r)b-JTRkhP6h;r;#[A+"aXmCVM-+s>G^Aq9Z^^ntj2dZ3ptg8K3;*K&3UmAn
'1\9^Bj\,76*>Y%:3gq`%c"ad(+,hu4G#=F2'KV6TU+euK:TslINKNuD64TFRAVET5V>D:1W
5n-Jn8dMd;0&KX(#K_L6Gp!O[Cp*lnYAp<,LY\LhGOKZiJI7sPDalJ%\/b#G^]A+#j!MRe_Ml
5Y-^bGod*\`0?4pcCu^:+P7j#OO?`.e[O+_*]A!OX=YJa)WX;*j\K]A&$_c?8lCt7AVYS(rtPm
Q"H_1f?Yrt_>cU/_LL$sZ#BZV=$+lmQ1Y5Db?k.G!#e[M^`t-eg_7@aK8oKupb,d?5qs!p)n
_o8rY7UbrI$DmHl7]A8Gbrn65\dU6jWB?Z\D`_t5=npr)`=B1e3M.$$]A.9J'[__$K-n"/cUXd
>sG@&TI+c#EF_%aeI6SV(9Ro?)-*TOnR@Yr((537D/GBAa>_cP2n2F/)VIfZD4)fg#=7hl*s
?Ag>N7MB$-7+,ogXa2-#7!kab!`(U+3CG.o(7Y@\o>,l;J*nUWp9/]A6/g8:&&&G_g%B^S]A+N
uSo"PH6ro-JLnb;d5*e1,:`WM^[HU\6S:D+Db>pa_,Jqu0?gWHJ":'X4-8mL^J5o))ko)M.\
Lb!9K4(?hnhF7g0QV<2@GQT$E,]A9bQA>f9f$!)AbBs)b8H&"N0k8XW&%%!0]AJ?rJ0NaXhMj$
:?BgB+A0Y.;0/C=p=*4/mZ\0HWO>^H,S6o$5QFRQ\!QA5:e(]A=V)gJ1SQtL_7o:B6:)9XFp8
/Zl(9uV8R.TBi?Kfm<ALms#tJ7IfQ//#&_c&"<,UH\b.C-1gZ[A)jKOSVU_?u!8AFCuTBTh'
/0T;ZV]ABW]AbE,!eM2PNK*^Hg8pB"mQSEng%/;QH[1lBqnW2E:pT5E?QcA&)=cLs/[W]A1aL<g
DQtA2WrAZY>SO8Q#WJ5d2Hl'8.O-K+uA@NQ<bV$:QL5(n`>b`9k1PWr[$TkI.Ii%%ZV-9)TQ
d5Z6j8dkc9De:KBCHS1pfpMIKpDE#m_FYM?2e(6ga"QmE/Pq@(pfNB;Zgnj:SV42V'q&qYJL
Ve')-LEZ.<4^3lm:=)lm@:=2;O/@U`bd'BJr9@,6,&Vo<oXCm8pMh\^1`#RfJ';p>#nhf`lk
\*-1Aru]A%q4#+j[Y8[7Bd*EBCW7j:j!VD;4E#liFn)6Hg#q(#u<C4H2-)Dr-:b$E\$U;FklW
Th$#F"W7#4,>rd`O^)HYellFFf!<4ID?Bd2DQWd\8pu+RXYO)TeTnLWK*pT;q$[;$'bNd9%R
P^4^kDWS?\7>6QQ'2n*EU>X?'!,ZhRaEPY4Ke=ooiErqG_[:BVK+qgq0d4)#GJj?0"%6=+V@
i8AgI#lRYhC1H2He=YSB+T8)6#Zt=$>IaK)/8'uIMQ3kMickJPh%LQ]A*l2[@5U6b0F`?OkRC
O_7H<lHP:c$"W1B`IV@7r!3qB\=2a\m)ZuSu^>(>ADifYk!M*VUaHd`a@6CE'p_['U)WLHu/
D8[2.huZt+fIk'`MsHQej]A>Ri*VZgnd,K^du0"To,*T*QtG#L&goF.Yj.LZW28qc]A#dG]A&`=
a?<9N1hcA6l=D-R'VWMWDJGP_BUKbY8c&,GShp-TqE'utB7R^GN4sL8o3kr999`)J6HCb2<,
sfocpjl/Btfp>$m!/N-HU-^T5;Z#EWtUN6B_Cr]A?8bN1+Gua&TRUr2"lGp+B]AI\[(XM&<LiO
6Hn/V-:T1=]A5=XrbcN6"hmFmnk8;+dmTq0.qkQn]A<r^CAi;9oCr(U:djA6En3-.^Z3KMAiqH
#iQ>-YtcW[Sbh9c(_G[r$f1M'k;NhX=?3KKZlYYI=7]Aa61M"J?b^5kJ,;Tu%>Ua<XUnULS2R
Hm@I6atJ(""-!hbSkh06Z*cF*fQ]A1T9A8J&!'o"'nsKD%O\c_"#5kl.n'A9,^b6^?%`l4IA^
39E&n^(\pT;4/_T>N17uZ"X8DGKLF4F=Is!Ma,,t[86MQ;X2R+a0XVj<I4]A2,$S1:("p@GgL
&tg"#g_8<.#E9h7^>AIR0/`:[GPK%Km6+k&.@]AnnT3nGk[+>D_2[Fa2h8a2V#\4;(*'*c[f1
bYmQfTJ<u)%eX()!4[/[M(Gdr98c&A>9,8H>WJ-Suo]A\gYBX2$%#lW2c,j[/F>E()*Pu(/BQ
.SCmBHZ0@<f3\DVb9f'g>i$W^Vg1V_osZ^,ROZ<gc>3[=(Keg#s,![GH4"c(Wtmfr?3&>pQ"
NTD4Xj/AuX0h2VO[4PZh6KLQn6o"cLdnA`A2'IV@V\9F\7%oB@eJrRV'Z=!`2G*:Q+/Gb1/H
eC)"<+.a*WdSY36-BV^AS#2mna>LQ?J^b.MA%F7LKhj`/W=EB00H=Hlhq&"p_jjpbjfQ4`qu
!76i_6SE4JDEE0hQ,jaXHt+cSdSK]A8>Go3j2>qgT'8Ff^(BQq#2Bpo0'Up'$6;\MM?;Q+3B'
\."Ff!qBK=598m0fC:73r"a98J@mW=L$FcmZNa\>_]A`'_[*cUH#9KVmM2T*<$qieHM@rq;$:
GQV?Pu.__r@?jnk2FRr\F%$lpfjUO0tI<unX8&K2(5TK-)[TRfrpjlFS!^Gbb1#iC;=:^h9j
g?kI:I&bY>d3N2VjijM\Dko_#j!)?d*h"6ssuQ-R7c'U(Y'5lhL'nI'fud2\5ugJ'(tA=;=<
Ttc9M>W-KSd`p,^Jn-UCm(s!rM2EfhZ,qIfkGNTgH)HaX%PR5b*Z`kP[N,pjF-:-^jeHI;kF
ITT\+j4C2J''&X?oht-Og+(K-+tRHZ;W9CnaoMe'/S!T"-j]A5Ad=EmTIReAXn'obbu0QB]A=d
::c%bMO#<l_[`LG,_(@22c@7uWV,$W"/t="?F^:Bum"+J,f<fs&&VT<Nn5VaiE_mo3<p1&'%
2&Mi\0"G*0lhG<c#%>0oP3@ar6*938G79<,g^@e7<`sq[]AJ0f2:p=\PO8$IpKX:rp4*^G=(p
bDPZ:3ZQ'IX$e%F=5OumMaORo$OnXUDFLS*-VGTSE0g/9CjcVS`Ve'1l1MS10p>]AXepciqLn
F(<"p>Xp[:[-oCWXtkLJEb9G/Cir2&O;WEK,'s[mI9nmh,Y5SM>A?j.&@$SfF,P^)";`@q)N
=3DHp^M85P?2".Z(c/CL^/-=Q7%\nn7j_@mXG+[!hbJ55Tgc>VP'!Ia8,GFljK'jH(aj2DFj
d0b'NubTRnmZ;qN<,<JANm\H$i+-#J/b!Uld_fG>2%c<.hj:'k=p$=Y-Ccfn3[C9pnfh89Tk
lATsUS<Ub_K,Yo69T$07cEBYS\JNZfOJWG)K/Sfi+=(@D4\DoH/33O)Ie'UEI"!BTeN]Aq'`2
\K*NTr+.-'26I($er!HKa%ME/tM;4@k2;t`ZLb^/:[[%S?!6usf3DS5mZjcj;W:5#_af@fBL
Hpl:EYI\B='p76OdU-?c`j>X/S8%b3f:77;)+LCD]ASeWi7F96q0tf/.$NIcQEDEr!+nb*B6/
/oVP9K(ApJ^kRGa'BU>`GGgFN(khI\ce=K+N.GD7Ou*@^'PN/@VNnn/n&B8+&2WbG,`<If,8
)D5RECkOmFd`ASIIal#uJf3LHApid\0)BmK2ZH[GE3Hk5*#2$0^l+ARTpn8d!X.h2,3"Pi49
o-O#FT.+n\;L.uNof[hQ0`C&OY!S<Q))7#D3,nS9+>),FP^'#ZY#0P<hVNfV9ES`"+*VNMDE
Ljr'\Nq\0fiU>p>pZ<b*%:m%Gud>E%)W/AWU#YYTiPW@sKc7oM?fW]ABRrhtDI3B1CKYnV/4D
^t#0&KIHYIL0@gE:[DKd2Cr9!;lSYaN,1;98%k-,R/)hSfOgA"fKlisOkj4*,@31%2_Kj3kU
p7m,j)[G6X6NLp1b)mG-IO&$<K(i\-8u5@5D?N-Mh#^JE'mKhD:(ulVV;CN=:\YiinE9)K;%
Z2?Fm1>$'jg^XDZIeu`<;]A&;pY!$E?)A4L5:2*4;,=5XEP[,jI:-MZ<j+CkOcgCI=H=&k>VK
YMQCUg7mWb\H&4)g'1T')So?;UY2H/0E]A2`]AEJ3.rd);E&VT+XWKP25]A9VEB8t-k+EgggQW&
&"c\k<@8MXV1/VQ^;9-%iOe2@>i`5sW]A:lc!B"OZ'K88uNo[p>-o$2(;/PAS*h4dDL?NGNK7
Xj<aViJ>sT<Upm[U_@[gDA!;F^QPN=e<*O.@ABG^mr:LbC0^38``N/<2==p]Ap:TIreL0cjjG
D53TO=j#%.\jO_\(WJl7-_Z`V]A;m#tgfZ>M-Uj4-U<`hF/9eTCqjHWEt]A'0_@t\0d#_lI<MC
p7E7;=R7Pa,iH5Uqi\sTZ>.?\2iG;l59KF.J,2q7qEDl;>@@q0KI43rt9aA>Lj_k*0Nc/51^
L.Qc;5)&QZK_,,kaVB*ds#+@)FPGIr1=2'-pBW(5&r\%il[,Vc=e*n`1dfI.`fNRo*FiZ=^X
[l$d(P)PK/`JV_?=cn(?9oYbDbk/=uJ==!.D1*"DcAW'io4c/C"(p>/B,Jk"Du#-M`Eg=V)J
@VN<b;00A3BNcIG:u!SSo=N]Aj8;g`L_fgRTib[\8%7Fft(%?Rb'&P7nl1#,pao-$kSN?N%L3
q/4?O#E\)*5F,2(=r\^Mrp'r^lMeNu!Xe!scc(CE(>X[!e#ocA==5rY)ANnD*\caX:DpcX8q
no^pZ'*KL/6^(]A8[/p'[_WR&[HnKk[-B0#lj&VI`1e%I!@N0S:qP`uR[3pT!IqHY'u1cJ[%k
%0'h0(hA$2T>;&Y#spSQg<t6S7_=TE^&!8/.Lm`S/&8#,IMf*k',0gPsn6Ini,3f'.,?uCNd
k?4Y14orO]A+mWU;m_X]A'Q)Im9UWJ^%ea?0dNpe'o653_`s/0%7Qn:J=.:,)+jF(CuOlNNJ8W
r@d>Eg:f#s$:@8j(i4Yf#`Gg9>hI=L>W0pJ=kV(G9f&`W2)=AC9\JDkU0m/%`3^9a[kojp[e
V_6"uJ)gi?+(c^qEoX$9$qa#3N?/"nX\`?%g2G-%iD8`ifUL?MIPk_csq4i50Ha&Jr.R9<#@
SbBm9@eX<-sfLN2iUZgunO(,;Y%5YkQhPetkTRA!V/Wpu\Y6H)q+P.UkD^RRC=0hbia#:rO(
u1P%qG$aEpJ)%inQIWo)*;6B[qcSX-jPZ3HprG)GLeVbm7T:FG`H0F4@\g#SVKGq>DK1tr^@
Nk-tJZ_jll/D/gg!smNk?'\<8T.%bseGaI>oia@dAXf#A2'k[O4d[%@]ATnFr_R=7Aoac!pn`
b\!q_3,<Cbb9HeYc26e,.`YMoiB,777(D`7haZT%Y8W++,$<go<r09bbX"iC'a`40K!R=obN
qXG`]A/N`ccQ'aq/=XA;b9jQ(tY?IkZ6IpRJ:T3DWb?=qhcL[4b"CBq*A1IeZ[;E<kA,%c?P^
LRqG3*gdhn,PHHc50g#cDmeT!V</LN`lMCDLF,s60YoVP8^C%87G@RX&?BeKnUm>-umgER6Z
p6.RS&E,>%K#42`UH3us3f..!OuMq1-/e&,;`W)8X2+ob0ik7.5gR2`%6#1m`H&o_fP>O&ln
_@8cWrTr.TA4\s']A2$f0Df\Rj`5pl$ZF(t>,L:AIs9]AKp%5k-hfS`^_2snqGdjY%g/bMTU^L
4f2WBG`VH!?'4_J8s0-eSVLZcl'KdF+eK"(,BAOt<@btP<P2fqjuG@Nm#_s+q*"?!EbZiOG+
YeGj$6P-qM1n$>9e5pcMG&i;V))FAFS-U_!'NKaDLPG=c(&2cF$s[er/jX9MMfhg@E\a!+)W
M/ck4Zb.*+^kBmE)>EO?6`Fe@.E)W)l$^7:ZJZ3rc@6"6mRPcL>;]AVSLX9oPG2S>Zja04*Ao
imjDpp[PpK!RLo4tTk\Hf!hiQ2lj78)Gh2*D@jJoDEEI/_:5dm2nVs8"0Eh>j2QI$)Rr[&f!
hKF?;OlI!bsURBl6o4>#-ej>S\XV7;0#Z/)mW#+.5!r1Z>ZNE_'=37<;DE.;:FV3d3^I%U:p
=&[/%Osur-o:<\A:LAMpSUGr4;<s9CBOD`"H3H((;([`bX8cC6$V'Jk)WVm_L&#dihu\]A/HT
7$G&OG4<X8-(%N4C\,,#%3Ea*,XpqDlo>BHJr]Ak\[bc>(!*gNPF=:O"&+9[VQ30QE;4L's&V
mGoC3r&)#u(6[c-I(aHEQPPl^9-@-8O/)j2@"V9[qp+Ka;9H5W]AT>u1o>-+AF`TL^KJO`#UM
eqL5k<d>JKdDW>2Uhc(]AA.,t)`If<anR!0J0]A2"BEeX_#9>+?9G8V]AF(XcC_fB)[a.2iaTR8
0BX[U>9E]AL;idU'4o(]A14QqrtM&S7[cEg,@7^[i[?50k686ZE@jcHG>=;09*Hh@dC4EP8aQU
YNA4AF77hZBA_fjkW(N8I#:41ieBP#[UukI[A;UG0#o==lsGGf[U*o*2NGm#2'+1gFrVtRFZ
eunA0ua3]A\=U=AB_E;Knf>UDq\cXfO]AUM+.4sl7Blc3lA'P*81AXUr^;Z#"lp`+.eGu92]A7`
1#F3<l_:S2r#euhk(Xcga#]AS]A4@0PE8Q@jbOGAZR]A48>c$rI9o6Yd72KbjE]A#cl^j5=0J3t=
t54Sn&>tXJpWI*&M:0[s8?.nSnT'U<iauirI4~
]]></IM>
</FRImage>
</Background>
<Alpha alpha="1.0"/>
</Border>
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="2">
<FRImage fm="png">
<IM>
<![CDATA[m<IeQ*74C;Om"ZY&knAuU:2OZe<$WH.+)h[M)&8AM'+'I7'ro?LT&US&V?sVNR!4)b96YK0l
QKns2=fnpYkI]Af!EZUHgQ7,HM6%<HQrW03bhE)&eYhgB0)L$,UB2Ps7VG:jSs%<kT<D0P'b?
t1tBCX3W$?d7c9]AC"+A46b_^aC:FT8Ng<M-[3K$."4mtCh"IA.V)ANEJ;cCsol,as(#iGOYn
:R3RS%BT25rl%PrJY>YSAMJ;]APOXS<uiGA4/O#5kH?pu7e`CMQTMKCY_d8C$O,a_*HUiqc]A$
u,FaKdEo.N]A_;Gfi[qMaf.:F>UphK'd*5J2t%3dLts3tA>djF//`BY=Y;rK\c\&XWr,GI9DL
[,3*05UlChKmu!J4;6jr]A21H0^".mQ(*#JH$c(;oK09mS98k+QM&)/\Us]A%D4'oRp:I7:Zot
[Wp/T[#9_e_(%e>T]AelQf-Y"27QLj5N8[j-,Y6i6LA/Y#Y>DGb!fpZfXo(N\lcoRP+&rgF)d
>h44->n%8Km/1uS[_Wb5i`KK4f,k_jr*RB'MEVQADL]A"eEjasdk.luk,#laHAn[KWM?]A%j.[
//M&@"GnEOa85C)?P-Xj7OrcO?`1Af?%Ys.4gp8l?3up83b$BA?+B?a+%"&d!Qafm_5l,f;7
/EE$-)jj;AB?a/"(V0.>>>Y6:h3*4Yg[#hO&qcAcX^o#&,dg^E7CI$?IW`iQ<0de='T?0CSS
/nHc>mr$:k@_PDp2d9J1i"(*0f:>uj,#kG'YP=\[OuK8&^U(s?l.B+]Ai4'+kO[l(1:J)]A\28
Fa;_"Z7*N#9S:hr\j7;774*Q&f.lV:jJh2rZCf<L7o/.p'^@XGU)]A_QqD4+65H*0,R$Y-ao6
.b]Al5meHNp#@Qh\E$mKV0^6.9^6r4625@lXi/T!3;eLL2Q\K(d/JA18Himnpla'4$PMYnK@e
CqA/;_1[#NY5-:B$aD_8uN3U8s[R:MeYnQc)QbnG@/$joY&@Ko!MIjRo5>iXq>.`%j-#'J+l
`=^+*PD>p\Z[O&PO)83,3Was/WZ'^38P\tElu!=L:4m)8/=GGU@LQ<AEXTj9F,A>Q9WfbfY3
d6j2kJ8\GPlN:>hhCADnhD>P+9:-OV\0'RXOU;'=5rqsnB=0SQ`O4IK`RQ"H$#bgYU$Lc*7&
7UOGu/_<'Fa*d)priJai)BW-I<7&gt3^DTaaXV%Acq$eX[k%f=dEu0G.QlI[S>el]AbH/l]Ad7
FoQJ(t_VuH+=Na#)]Ap5:6Y_t-;WGgT3@77JX/u_PJ0:T+I%e=CmhY*K2kj%mCk@Z-N9rI?iU
i)`dQe'k/!ot:J*toG9?KNbc*WWLG]A:urq-Bc"E^F+<=89m$tPc!'&lO2Gb$Dr;/0B'1e/bo
f2aJ;j^^eA8+KR-F&<fqX'!pX,#=5SUu0hT.aUuE0AKf./O9_H]A,!l,bp+[OTQ>NLdY]A(UtB
hjK/WB?*2O9oTq/4R?OH?ofL^$f8E;-h:Gp,@(?^K+AW]AJ&T<oGt?*&p"923V/$RU+;;qD-e
R'-7l62d+k1Jb^./=_+SMfL*:Qgb?gqi?/ha7\rn84g`rc#[+N+cXD^=m%D1%++@Jp!Yh$4k
-+2Zio<!V=X3AP08[TeQTN#`8a37&mK95X2^n&1GX[7r2l("1[p5N\NI6kZN&OOs?O`EkJoq
=]Ao,[J]AltS(a9Wa;W_84%_GU%_0l7=Gg(d?/`#Iq!5tu5P@cHG9>MLRE?&u(B?44\MYFuf4V
r.@@f%A^b6b`S5o5TU&(_'"'PXep6!PG3^*FIq9l#oq$(<6a&(cX`t0Hjh#1]AOcMMkI0k!K'
]A08A"m?e?@M!mGG>+!I4%Ot8`6h?<jLX43&0q(Mo\Nk!sZ[fqO:+90K>"4&]A>?@:t3]AX1MlC
C>gn&MpTU9c6<]A-T+^_g#,\G4C[ERb`ZbN+SH%QslBV,/kb\I,H?Ig,n-5HR3-$jbi@H9EVT
FPMH2H58of>!8^:Z*D5CA^DR?g:'LmV*ocilO/"XJOE^:Q%`jmR0pfYJnXJl9fe6ErXf]Ai?.
MVS;[F;<eO`a;),?$l2]A=,C,[UtWclW6$8=pb"/!F(#Qn_qI?=7QY]AGTWkfPXZa$r=.PYQr,
2Hf&,(F,N'u557YK('!-=0!QR#!LU[;F;$*<=8`3p:7C'&b4WO?MPHrY1%&4LT&:aQTqQMRO
FCp88)%iGJ$RR>M.1X<lKPl4//r72VF$KsDbP\==(aRuE-1.H%M=_j?D"L1\nA:\S,@Zhh7X
JcscE)/lMU9Bgr#?mk7SZO/:3<&2>Y939=jODk4uUZm8B>6W=3,8+1FKr1A5YM+;]A_9C2^!Q
J`/!6rZ[1&<h(l#7AY<%jSIFLr8^j/ulXDmmD^p(sH_'G^*s)ZNH*RCW7Mi.nbN)p,FYVZ&b
@LZ9,<;U['oUfSJ#gK[1gHSD3G23!T(cH@OhBr=AB.;\Kp#llU6sSLRW$MT/CO#&?gWlV#FC
GL5WD.nX*oLKf@G+7q8J"#m'[P?YKu1&gK3pGYIfhjL/XbgHY:Ng/2\1pp5qNY'slqi4ZU$;
44(`56pcGJi=N[c^FQh("EuOb(Mk%J]At(ZqhYhdqU<AsGcFc<3ZO6;Fn+.g5_(bYK8rDY$_(
88?,BQANT_%pBGQ:fZ8iQWIJdj$D:Po`@-"ZqqNDTP#+?j"ns3UOHKj0^i:i%1$D\ofD'A;a
r0>q^mmn796+/)]As]A&L+a[ddtc1FS'Bj@pKq?\q:B[/FpKFRd<r?4rD`SqeXIO)NI0OF//o,
pR]AqGX=Tao&qfC/loqM.$fN3394D>TCP8"EA,e[J^,?FpE#WlPiV>0lWoeV4J7ao;1aIS<q/
EJ+o-W$OT*jiC)71J!W2o5rs/T("XhePlm!aM.bfN<?Z4^nT_0;X?o+jLl+kD2S=#m1r&Q7%
nl"K=Z?L-p!sU)>es'kf=V1C@4)2PkjLV;0n#7_?>NY&#hce-qN+5cg#=.rs+KQZpF#cN?"u
O4e,msr^Xhb]A%3/NIgD0]A_o\CL%Q15lkD(Zs+`.Or[4c(t[L=8+R;CuMW:HQSO;,0r2ACg0[
8rZM+b(D,ik_e%$FI^Q`-rT'?1H#,giY8WG%R_(YlS;14Z&>5h;Jc\/)lpct_UB7NLP=)4lU
lethLR!(,GG,r)b-JTRkhP6h;r;#[A+"aXmCVM-+s>G^Aq9Z^^ntj2dZ3ptg8K3;*K&3UmAn
'1\9^Bj\,76*>Y%:3gq`%c"ad(+,hu4G#=F2'KV6TU+euK:TslINKNuD64TFRAVET5V>D:1W
5n-Jn8dMd;0&KX(#K_L6Gp!O[Cp*lnYAp<,LY\LhGOKZiJI7sPDalJ%\/b#G^]A+#j!MRe_Ml
5Y-^bGod*\`0?4pcCu^:+P7j#OO?`.e[O+_*]A!OX=YJa)WX;*j\K]A&$_c?8lCt7AVYS(rtPm
Q"H_1f?Yrt_>cU/_LL$sZ#BZV=$+lmQ1Y5Db?k.G!#e[M^`t-eg_7@aK8oKupb,d?5qs!p)n
_o8rY7UbrI$DmHl7]A8Gbrn65\dU6jWB?Z\D`_t5=npr)`=B1e3M.$$]A.9J'[__$K-n"/cUXd
>sG@&TI+c#EF_%aeI6SV(9Ro?)-*TOnR@Yr((537D/GBAa>_cP2n2F/)VIfZD4)fg#=7hl*s
?Ag>N7MB$-7+,ogXa2-#7!kab!`(U+3CG.o(7Y@\o>,l;J*nUWp9/]A6/g8:&&&G_g%B^S]A+N
uSo"PH6ro-JLnb;d5*e1,:`WM^[HU\6S:D+Db>pa_,Jqu0?gWHJ":'X4-8mL^J5o))ko)M.\
Lb!9K4(?hnhF7g0QV<2@GQT$E,]A9bQA>f9f$!)AbBs)b8H&"N0k8XW&%%!0]AJ?rJ0NaXhMj$
:?BgB+A0Y.;0/C=p=*4/mZ\0HWO>^H,S6o$5QFRQ\!QA5:e(]A=V)gJ1SQtL_7o:B6:)9XFp8
/Zl(9uV8R.TBi?Kfm<ALms#tJ7IfQ//#&_c&"<,UH\b.C-1gZ[A)jKOSVU_?u!8AFCuTBTh'
/0T;ZV]ABW]AbE,!eM2PNK*^Hg8pB"mQSEng%/;QH[1lBqnW2E:pT5E?QcA&)=cLs/[W]A1aL<g
DQtA2WrAZY>SO8Q#WJ5d2Hl'8.O-K+uA@NQ<bV$:QL5(n`>b`9k1PWr[$TkI.Ii%%ZV-9)TQ
d5Z6j8dkc9De:KBCHS1pfpMIKpDE#m_FYM?2e(6ga"QmE/Pq@(pfNB;Zgnj:SV42V'q&qYJL
Ve')-LEZ.<4^3lm:=)lm@:=2;O/@U`bd'BJr9@,6,&Vo<oXCm8pMh\^1`#RfJ';p>#nhf`lk
\*-1Aru]A%q4#+j[Y8[7Bd*EBCW7j:j!VD;4E#liFn)6Hg#q(#u<C4H2-)Dr-:b$E\$U;FklW
Th$#F"W7#4,>rd`O^)HYellFFf!<4ID?Bd2DQWd\8pu+RXYO)TeTnLWK*pT;q$[;$'bNd9%R
P^4^kDWS?\7>6QQ'2n*EU>X?'!,ZhRaEPY4Ke=ooiErqG_[:BVK+qgq0d4)#GJj?0"%6=+V@
i8AgI#lRYhC1H2He=YSB+T8)6#Zt=$>IaK)/8'uIMQ3kMickJPh%LQ]A*l2[@5U6b0F`?OkRC
O_7H<lHP:c$"W1B`IV@7r!3qB\=2a\m)ZuSu^>(>ADifYk!M*VUaHd`a@6CE'p_['U)WLHu/
D8[2.huZt+fIk'`MsHQej]A>Ri*VZgnd,K^du0"To,*T*QtG#L&goF.Yj.LZW28qc]A#dG]A&`=
a?<9N1hcA6l=D-R'VWMWDJGP_BUKbY8c&,GShp-TqE'utB7R^GN4sL8o3kr999`)J6HCb2<,
sfocpjl/Btfp>$m!/N-HU-^T5;Z#EWtUN6B_Cr]A?8bN1+Gua&TRUr2"lGp+B]AI\[(XM&<LiO
6Hn/V-:T1=]A5=XrbcN6"hmFmnk8;+dmTq0.qkQn]A<r^CAi;9oCr(U:djA6En3-.^Z3KMAiqH
#iQ>-YtcW[Sbh9c(_G[r$f1M'k;NhX=?3KKZlYYI=7]Aa61M"J?b^5kJ,;Tu%>Ua<XUnULS2R
Hm@I6atJ(""-!hbSkh06Z*cF*fQ]A1T9A8J&!'o"'nsKD%O\c_"#5kl.n'A9,^b6^?%`l4IA^
39E&n^(\pT;4/_T>N17uZ"X8DGKLF4F=Is!Ma,,t[86MQ;X2R+a0XVj<I4]A2,$S1:("p@GgL
&tg"#g_8<.#E9h7^>AIR0/`:[GPK%Km6+k&.@]AnnT3nGk[+>D_2[Fa2h8a2V#\4;(*'*c[f1
bYmQfTJ<u)%eX()!4[/[M(Gdr98c&A>9,8H>WJ-Suo]A\gYBX2$%#lW2c,j[/F>E()*Pu(/BQ
.SCmBHZ0@<f3\DVb9f'g>i$W^Vg1V_osZ^,ROZ<gc>3[=(Keg#s,![GH4"c(Wtmfr?3&>pQ"
NTD4Xj/AuX0h2VO[4PZh6KLQn6o"cLdnA`A2'IV@V\9F\7%oB@eJrRV'Z=!`2G*:Q+/Gb1/H
eC)"<+.a*WdSY36-BV^AS#2mna>LQ?J^b.MA%F7LKhj`/W=EB00H=Hlhq&"p_jjpbjfQ4`qu
!76i_6SE4JDEE0hQ,jaXHt+cSdSK]A8>Go3j2>qgT'8Ff^(BQq#2Bpo0'Up'$6;\MM?;Q+3B'
\."Ff!qBK=598m0fC:73r"a98J@mW=L$FcmZNa\>_]A`'_[*cUH#9KVmM2T*<$qieHM@rq;$:
GQV?Pu.__r@?jnk2FRr\F%$lpfjUO0tI<unX8&K2(5TK-)[TRfrpjlFS!^Gbb1#iC;=:^h9j
g?kI:I&bY>d3N2VjijM\Dko_#j!)?d*h"6ssuQ-R7c'U(Y'5lhL'nI'fud2\5ugJ'(tA=;=<
Ttc9M>W-KSd`p,^Jn-UCm(s!rM2EfhZ,qIfkGNTgH)HaX%PR5b*Z`kP[N,pjF-:-^jeHI;kF
ITT\+j4C2J''&X?oht-Og+(K-+tRHZ;W9CnaoMe'/S!T"-j]A5Ad=EmTIReAXn'obbu0QB]A=d
::c%bMO#<l_[`LG,_(@22c@7uWV,$W"/t="?F^:Bum"+J,f<fs&&VT<Nn5VaiE_mo3<p1&'%
2&Mi\0"G*0lhG<c#%>0oP3@ar6*938G79<,g^@e7<`sq[]AJ0f2:p=\PO8$IpKX:rp4*^G=(p
bDPZ:3ZQ'IX$e%F=5OumMaORo$OnXUDFLS*-VGTSE0g/9CjcVS`Ve'1l1MS10p>]AXepciqLn
F(<"p>Xp[:[-oCWXtkLJEb9G/Cir2&O;WEK,'s[mI9nmh,Y5SM>A?j.&@$SfF,P^)";`@q)N
=3DHp^M85P?2".Z(c/CL^/-=Q7%\nn7j_@mXG+[!hbJ55Tgc>VP'!Ia8,GFljK'jH(aj2DFj
d0b'NubTRnmZ;qN<,<JANm\H$i+-#J/b!Uld_fG>2%c<.hj:'k=p$=Y-Ccfn3[C9pnfh89Tk
lATsUS<Ub_K,Yo69T$07cEBYS\JNZfOJWG)K/Sfi+=(@D4\DoH/33O)Ie'UEI"!BTeN]Aq'`2
\K*NTr+.-'26I($er!HKa%ME/tM;4@k2;t`ZLb^/:[[%S?!6usf3DS5mZjcj;W:5#_af@fBL
Hpl:EYI\B='p76OdU-?c`j>X/S8%b3f:77;)+LCD]ASeWi7F96q0tf/.$NIcQEDEr!+nb*B6/
/oVP9K(ApJ^kRGa'BU>`GGgFN(khI\ce=K+N.GD7Ou*@^'PN/@VNnn/n&B8+&2WbG,`<If,8
)D5RECkOmFd`ASIIal#uJf3LHApid\0)BmK2ZH[GE3Hk5*#2$0^l+ARTpn8d!X.h2,3"Pi49
o-O#FT.+n\;L.uNof[hQ0`C&OY!S<Q))7#D3,nS9+>),FP^'#ZY#0P<hVNfV9ES`"+*VNMDE
Ljr'\Nq\0fiU>p>pZ<b*%:m%Gud>E%)W/AWU#YYTiPW@sKc7oM?fW]ABRrhtDI3B1CKYnV/4D
^t#0&KIHYIL0@gE:[DKd2Cr9!;lSYaN,1;98%k-,R/)hSfOgA"fKlisOkj4*,@31%2_Kj3kU
p7m,j)[G6X6NLp1b)mG-IO&$<K(i\-8u5@5D?N-Mh#^JE'mKhD:(ulVV;CN=:\YiinE9)K;%
Z2?Fm1>$'jg^XDZIeu`<;]A&;pY!$E?)A4L5:2*4;,=5XEP[,jI:-MZ<j+CkOcgCI=H=&k>VK
YMQCUg7mWb\H&4)g'1T')So?;UY2H/0E]A2`]AEJ3.rd);E&VT+XWKP25]A9VEB8t-k+EgggQW&
&"c\k<@8MXV1/VQ^;9-%iOe2@>i`5sW]A:lc!B"OZ'K88uNo[p>-o$2(;/PAS*h4dDL?NGNK7
Xj<aViJ>sT<Upm[U_@[gDA!;F^QPN=e<*O.@ABG^mr:LbC0^38``N/<2==p]Ap:TIreL0cjjG
D53TO=j#%.\jO_\(WJl7-_Z`V]A;m#tgfZ>M-Uj4-U<`hF/9eTCqjHWEt]A'0_@t\0d#_lI<MC
p7E7;=R7Pa,iH5Uqi\sTZ>.?\2iG;l59KF.J,2q7qEDl;>@@q0KI43rt9aA>Lj_k*0Nc/51^
L.Qc;5)&QZK_,,kaVB*ds#+@)FPGIr1=2'-pBW(5&r\%il[,Vc=e*n`1dfI.`fNRo*FiZ=^X
[l$d(P)PK/`JV_?=cn(?9oYbDbk/=uJ==!.D1*"DcAW'io4c/C"(p>/B,Jk"Du#-M`Eg=V)J
@VN<b;00A3BNcIG:u!SSo=N]Aj8;g`L_fgRTib[\8%7Fft(%?Rb'&P7nl1#,pao-$kSN?N%L3
q/4?O#E\)*5F,2(=r\^Mrp'r^lMeNu!Xe!scc(CE(>X[!e#ocA==5rY)ANnD*\caX:DpcX8q
no^pZ'*KL/6^(]A8[/p'[_WR&[HnKk[-B0#lj&VI`1e%I!@N0S:qP`uR[3pT!IqHY'u1cJ[%k
%0'h0(hA$2T>;&Y#spSQg<t6S7_=TE^&!8/.Lm`S/&8#,IMf*k',0gPsn6Ini,3f'.,?uCNd
k?4Y14orO]A+mWU;m_X]A'Q)Im9UWJ^%ea?0dNpe'o653_`s/0%7Qn:J=.:,)+jF(CuOlNNJ8W
r@d>Eg:f#s$:@8j(i4Yf#`Gg9>hI=L>W0pJ=kV(G9f&`W2)=AC9\JDkU0m/%`3^9a[kojp[e
V_6"uJ)gi?+(c^qEoX$9$qa#3N?/"nX\`?%g2G-%iD8`ifUL?MIPk_csq4i50Ha&Jr.R9<#@
SbBm9@eX<-sfLN2iUZgunO(,;Y%5YkQhPetkTRA!V/Wpu\Y6H)q+P.UkD^RRC=0hbia#:rO(
u1P%qG$aEpJ)%inQIWo)*;6B[qcSX-jPZ3HprG)GLeVbm7T:FG`H0F4@\g#SVKGq>DK1tr^@
Nk-tJZ_jll/D/gg!smNk?'\<8T.%bseGaI>oia@dAXf#A2'k[O4d[%@]ATnFr_R=7Aoac!pn`
b\!q_3,<Cbb9HeYc26e,.`YMoiB,777(D`7haZT%Y8W++,$<go<r09bbX"iC'a`40K!R=obN
qXG`]A/N`ccQ'aq/=XA;b9jQ(tY?IkZ6IpRJ:T3DWb?=qhcL[4b"CBq*A1IeZ[;E<kA,%c?P^
LRqG3*gdhn,PHHc50g#cDmeT!V</LN`lMCDLF,s60YoVP8^C%87G@RX&?BeKnUm>-umgER6Z
p6.RS&E,>%K#42`UH3us3f..!OuMq1-/e&,;`W)8X2+ob0ik7.5gR2`%6#1m`H&o_fP>O&ln
_@8cWrTr.TA4\s']A2$f0Df\Rj`5pl$ZF(t>,L:AIs9]AKp%5k-hfS`^_2snqGdjY%g/bMTU^L
4f2WBG`VH!?'4_J8s0-eSVLZcl'KdF+eK"(,BAOt<@btP<P2fqjuG@Nm#_s+q*"?!EbZiOG+
YeGj$6P-qM1n$>9e5pcMG&i;V))FAFS-U_!'NKaDLPG=c(&2cF$s[er/jX9MMfhg@E\a!+)W
M/ck4Zb.*+^kBmE)>EO?6`Fe@.E)W)l$^7:ZJZ3rc@6"6mRPcL>;]AVSLX9oPG2S>Zja04*Ao
imjDpp[PpK!RLo4tTk\Hf!hiQ2lj78)Gh2*D@jJoDEEI/_:5dm2nVs8"0Eh>j2QI$)Rr[&f!
hKF?;OlI!bsURBl6o4>#-ej>S\XV7;0#Z/)mW#+.5!r1Z>ZNE_'=37<;DE.;:FV3d3^I%U:p
=&[/%Osur-o:<\A:LAMpSUGr4;<s9CBOD`"H3H((;([`bX8cC6$V'Jk)WVm_L&#dihu\]A/HT
7$G&OG4<X8-(%N4C\,,#%3Ea*,XpqDlo>BHJr]Ak\[bc>(!*gNPF=:O"&+9[VQ30QE;4L's&V
mGoC3r&)#u(6[c-I(aHEQPPl^9-@-8O/)j2@"V9[qp+Ka;9H5W]AT>u1o>-+AF`TL^KJO`#UM
eqL5k<d>JKdDW>2Uhc(]AA.,t)`If<anR!0J0]A2"BEeX_#9>+?9G8V]AF(XcC_fB)[a.2iaTR8
0BX[U>9E]AL;idU'4o(]A14QqrtM&S7[cEg,@7^[i[?50k686ZE@jcHG>=;09*Hh@dC4EP8aQU
YNA4AF77hZBA_fjkW(N8I#:41ieBP#[UukI[A;UG0#o==lsGGf[U*o*2NGm#2'+1gFrVtRFZ
eunA0ua3]A\=U=AB_E;Knf>UDq\cXfO]AUM+.4sl7Blc3lA'P*81AXUr^;Z#"lp`+.eGu92]A7`
1#F3<l_:S2r#euhk(Xcga#]AS]A4@0PE8Q@jbOGAZR]A48>c$rI9o6Yd72KbjE]A#cl^j5=0J3t=
t54Sn&>tXJpWI*&M:0[s8?.nSnT'U<iauirI4~
]]></IM>
</FRImage>
</Background>
<FileAttrErrorMarker class="com.fr.base.io.FileAttrErrorMarker" pluginID="com.fr.plugin.reportRefresh.v10" oriClass="com.fr.plugin.reportRefresh.ReportExtraRefreshAttr">
<Refresh customClass="false" interval="0.0" state="0"/>
</FileAttrErrorMarker>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[288000,864000,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[190500,4076700,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="1" s="0">
<O>
<![CDATA[业绩同期比]]></O>
<PrivilegeControl/>
<Expand/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList>
<Style horizontal_alignment="2" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="104" foreground="-526345"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m94j=;eMQ>Z7WJj^pE?#mDCOA3/_p69-(u=\:i6jV3DG!Z7QTE?q]AT*&.Ag*:>2u'FXfss/1
<fY@tCPcJnq#)jlTSi=GT6e7,W#IDut\s80I!-#OM.up&!l#:M"^IeA$8+:;6>5n*g4gn*b\
>F*_aqT^?e1cWOCRf`o.$B:kHS2.C.iPgctbOT3cZfup_-o&^,Cg%?F),u]A3s)$aul\9Mq=7
Hn$MIu+V]AGq=>k]A4%_jOS\,%oj9G$$=<U&bDaoafQp<co@Mj45%5MtI:Mc>;)L;EQmU<$jXe
j\Jf5_5F>Er7G(f@/*jUZCR3k57,Ia%0kEgtpYW/YneKhQ`eFe,D(At]Ao<QN/+mle$V`5.qV
)72ViO+1dc3L(f6B4<mi/FW2t6I,psm>)-m<o:RJRt^,h\P>[O;n_VR2a:R*)S?r#E5MH57p
9)8eP`_.UGCPthfaN]AI%A/:*7<YEA_-/#`0(8b<`dQA*[:S8ISda*@>!E4VPoilEZO?W\6O>
>b`P)Dp?^biHC0SXR.3=T"_KL$D'.T$@Tj0nDHDd2OH![Yh]A2>@/Wfk++7HofIfJN3\N-`0P
j[]Ae@1);hfT4VHZAmkD"uE<roj.fMD#;aEM&Z(^\f'b!5mL'I'BkIWpWh42#&GXjE=n&)KrX
EQ6h,c1WTQEJ?ljWtgqRdk4=th;5CjlpCKJFbL]A*WHY+ZWg+79&\(+=6sO)LXG9TXbMcj6=_
Obli>=G>pN5=ckcjoshXSIgWHh5Lu\@`kA72"KQV/63R8@P2@:s)LGT\OJHL+;,=>NabTDc:
cT;J]AR+!HBa@N..5&P)RXR5T6Nn4kGcF+nZPg.FEL5?:4tVNgrBBNU7om&4s6Q65>lP`f<qK
NJj,4_pp=$4Pfk]AR.ddj`_gSrGHc-O9HcIUu0(.W&I9O\oQ.#q2b:YH?59IM,+1G\3c\M6p"
Qd5Wn]A<A[=eRL68X7[/2p[em<6(/^S/`05J*f<`YWg[h-!*^5Qh5r_a6:d8VHV3tVYk;U0>s
C67SF1^BV3NU'T;\7A(*/LDhld`O'::"Q,S:JIWWpEnCldL*<Ci[X2d:DMc_>"iT+Y/,8Z3V
[$oJ9.uct^?qEQMh5!h)SQS-i"E1Z>p$@Kl1=oH9VLL$ep7B[QOd&A7.;$RZ+dA=8]A^2O;[C
ZN*ffaVVD^8n?r?Eu6KgWVXgQ)>`jNS7E<-H[67-Pd70n)3>(QdgL@otG0)Yfm<Dr\]A6muW)
h4$)dia\Oi6ngpYR$gG5tZdE;#l:k\UR]AujPQT##V)1OuO;`S#ZR[ij;T0Ce^'3.chhG,p_T
Tfr=%h'<@pb'<ijgrc?BGR043&W2i(a764,76pOa1<BEQTU1OC0'f7Lt<u3n#3#!!cO.*3\A
A<X->kheTb*EW$Hm)b742b@SrVEF8?b4mhiN*[&*`u3D<V:':Oh'i^Q<9_sHtu^QZ\=2NN2o
E9d#_=\`RID4T(FKB3LKFbZ.HirqP/R=720HaOWIe9"lcO2liW]AmW^J<BDhcMC"e._bkUGE!
)<!bkg8EFhX0Jf8D6lMkcc=`oEQ4jJLNsF"d69`=t#g&FD\E&i_)K(QtB#^P?l>&7a!'2hZ-
p[5MCb`XJ;HZ7'2k#:lL>XNZr#hN+)?/leBJq*ckKqj_;`pqQ\sZr[#W.fGRFBHi7pH`(Ut@
\eN+PBRl\1Q0mu]A`!l:='*R?bh>'#8llcHHL^m>i*Ya+44nV<-q8ZRTalq&`,<]A"Z($J!2ge
C[q#>MHCN>=2'd\,ZIZn**WID82"@4,D+:&dgKND%-a[B//oDq#Er.9)jp!AC&ZT^L(L".+V
`^N=]A1QiRnC`$^B="fHW!DFZ#C5#j2iQ4)3\!UoXCOFofqkRZATU!Lo3f8V()7iKrh(KLCNM
j(-rl'C.?86:Hok\(qARIum3VbE\7mE2tA@#%_;]A/k<L,l4hZA%n5l'"A%J)^i/9EeXAREaK
BO;fW@W/T[Dh,kkrbL562F(uiD(G/5LB!>DopaH^\&n#^oj:(a_B,]ApaA0uCSg%]A/i`r*EGh
a\Tuo7JI'U@#$Lj/qlgZS42]AqHYt6etD%@27;lp#D5\8A#f>*Ru+SXRr"QulGTX5:<ug?^Dd
Qi\PHWk)I<n_q&N=.e*ZO7fVI-#3eu/G4>!i>LE:E]AksiW)I@04-@at,)OF`H?;`:r-.lNI5
X,`X9l@jh2lBL>8H:;>ZK7:tON@oY/&rX'1B(7]A'GbXd`XL7`Xfbq8QKb#9$@J/<]A!cIB[o@
pF6i<t\Q#C^>E2S6(`qf[&naQ]AfcES4/;C)i8"M?\7n,1)"iMRjhOq)u1(:"rdm[X9LLRnpj
GqT,6;1De8]A_At$S5UU+\Kd+dM==0>eb>TM33@=h2K.dg0Y.JtR,g@:??[l<Fai[Mfg*>!2;
EdYPKa$uo"blg*K?&J@p^D),FYpZ0.SRk'aWFj#qY.]A+H8t##qXlB#O(l.T>MT8UW[RB.UH)
+K`Ld$$W05M&qn%YB!PBpp^'lau?\*R@.7e5h?hCS,)ZcHio%9j8p8!M-^BHs<k\Kk+PBpb(
^]A[oP#ojCqqMV/TE<l8*1f;&P$U2R?#=/1ZFb'B;)AfDW,k<kpk-Fu-bMNpgLr#Js3Be;&Ni
ml1^m_NE^XO?b);'\7c:I9oHJVXL`"3==.:`bU(6Y+b%W#ISi:58gl1T<V,[eAS2JXG(_*!c
WIm!(O6urAE))mh`%P0-h%=`Ij21ALsbu6bnn-*o'eZqg3TK<C"CRt@9r$XJF"!N']A[oN,3&
2mkRn.M_Y,TH01PSPmq".db+Q!lF=aRDe0al^e0LV*5p/hZ'jeBiOsGm'XFI_o3a/Rccr+r,
\U"]A:YpcU7KX)&eINZK+3s_DNfRf@A#R@`iZ:l=@#^S2eC)Kl<k@_)J5Rlk?jB>r\l".6gSY
J8Ot#cNh#H$.p@*DLqMHV-8K\GQQ#r-$[#SF$`Z6hc5)T4=&doCein<0jdQ2Yn;[YU6At.+W
0*,ooH;P*aMVp"P_)?P2tYVnf"GlcG3=*g:;Kcq$ms@+=U8:l_ke,CFM*WT2@R_$DllZAp-I
rQ?f1BpJ=ptcIY`U$7K-D$R"_WeWNn@L68.5F%CT1j97$C-6M'YX>rmJ0El>$f%4IQ5,<)@m
A@J-UgTf&V?D^k8?Q-X6!CM_^5`d%oC2?n0?glYX=3uG'RG]As35!.sQ7t3C]A@73>>sb<p..#
70:gcgqk)GI^5Rj[N0<Zcsem[=LlqidX^%G)6+sSi&aeoV6e1W+D,&r-un[c"1>'q#7WO6r:
0DO^Ns*mG=f-Fj==C8+<Uk324!U_@+Y]AYO$4:KdbEj/)W-5=\#g!2B<G.&&Z62L<c-N4h>p#
YGS^?P#X:$Nle&Xuj^S9P):i9tI2F+ojcOlie;U,XQD`V=,e\hJTA"B&"8$[<!gPsGfQ_.JV
t_G!me=JCTR24,(TVZ1L(_Ik-ES=>aC>Ks...>Fc_F*jqsFY.4eLjmf^g7Q2fi>15]AiJ4>V;
+De_;pur\K$45]A"5K+3_:t^U9QWnc]AFl-F\X6@?VuTND/+UF#R?4_:XV<bo>]A(_H<ZZ3"bK0
kP?_4lh,S?37-0"i[Z<UW'?r]AUBRK30>.K34hK<8PL>?>u%lU\9#Em!XI;T@Wulu!;GC2qp-
(ppFQG*+m0au>.d+m0StW*9d*k9RX%_OEq$35%KVNNcYs>J(ih3hB<[QZclH?G.OtI=#Dr^L
';!iruJ`c*K+5<WbS:pco9]AA90raoGaEl(=0j<l=P^oX1AbEUU9M*O=Pdm"C,F!"lK*$Jk-$
(1A&WLG(Cn)-TqCo`+(%g/SB'CBcNrFETMC4f!/05$90sf(L<+u@><j12hM=9cY7l'8d@*ue
5[()_s;N=_N[Xb^XE$2K>/EE/`3fQT]ANF%'NC2/D8.atA?KI_Ss1O`.'4YpD;;cX_Dg$PiIg
iN@pnc!W>INh$3W%$7E9Dh@O>,r=!YHd3Tn\B9/cq(S7J'mr\WnX0&m`Z^'qcKRT3^5<gB4P
3'eT7`sI\,K7E(#(J>,PNe,EEh^qI4"f[9L2dX)S%W/;YNQ&QK!)"9,e]A*G&dNV4+&ki`Lfc
U/3hZn]AI_=DfX$E'b[LEo&.d]ATO>?V+4W0El?rX\$)m.Ra6j<fUS"_C/-f<['j5j'G9=h$]Ap
m"s^@b?cX+9hS#%6*\?ICENkHtb*,ABTK-RY8A1['r)\\'a6[_RCJINBQS78"UUUAg__tP8;
&ahanXgsUT"nj6'Gk0/Y71VcXhtebU/-<4XQ%f52fFH6lhQc2U$b)m7!)r>dAFb)&S]A[<M#i
5=,9<E"Gn9KAbA%%bVHi(/EQ(Y%`StaTLI?#q&8tmO9X85DFqI/b.-,?7AN*+6N\eQ8KC7ZF
(o<O%S59<#$?@]AG-d;tq9+kcZcJU?!@*I@hm?*ko-$c@%-EYA3XHZ'I*0L3V;?66:0$K@jk"
-!hA[EgdG'R%7:)(0S?-1#j=rppL>5/83:`[ppdUi/>PmBoPJc=_/='4$_8HnUQW@F$$_\>`
XTLD)"7mgd-,,<Nqo\l=K.h;Bc-j,A_Wb4Z\_=l0q!D%%r4?c4p>oENdJ;m7#Ehl'jm#c(<[
+.f'-W3blLB.uo_3B'2ia:;DB\ri>h\n)kk]ABK%h\U;r.`s_Xio2R"T_YM%Y3s1V80Z"h16P
sYVllVS'L:U#\eOE#Q4j<PhP:W3PVs(l*EL'j5upLC@4AcZU!<\;ZZk`:f%NQ#W6<UZV/:o_
>oQogEn>TW]AIJ.pEs,e`\tm#s+PJ@8LgR/c"=_N"1s#%Zs+0m,>-,W&#3KI0\DUsfrX8R4aI
^Q1L]A6p1~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="250" height="150"/>
</Widget>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[723900,723900,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList/>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList/>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="11" y="211" width="203" height="163"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="report8_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report8_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="宋体" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="2">
<FRImage fm="png">
<IM>
<![CDATA[m<IeQ*74C;Om"ZY&knAuU:2OZe<$WH.+)h[M)&8AM'+'I7'ro?LT&US&V?sVNR!4)b96YK0l
QKns2=fnpYkI]Af!EZUHgQ7,HM6%<HQrW03bhE)&eYhgB0)L$,UB2Ps7VG:jSs%<kT<D0P'b?
t1tBCX3W$?d7c9]AC"+A46b_^aC:FT8Ng<M-[3K$."4mtCh"IA.V)ANEJ;cCsol,as(#iGOYn
:R3RS%BT25rl%PrJY>YSAMJ;]APOXS<uiGA4/O#5kH?pu7e`CMQTMKCY_d8C$O,a_*HUiqc]A$
u,FaKdEo.N]A_;Gfi[qMaf.:F>UphK'd*5J2t%3dLts3tA>djF//`BY=Y;rK\c\&XWr,GI9DL
[,3*05UlChKmu!J4;6jr]A21H0^".mQ(*#JH$c(;oK09mS98k+QM&)/\Us]A%D4'oRp:I7:Zot
[Wp/T[#9_e_(%e>T]AelQf-Y"27QLj5N8[j-,Y6i6LA/Y#Y>DGb!fpZfXo(N\lcoRP+&rgF)d
>h44->n%8Km/1uS[_Wb5i`KK4f,k_jr*RB'MEVQADL]A"eEjasdk.luk,#laHAn[KWM?]A%j.[
//M&@"GnEOa85C)?P-Xj7OrcO?`1Af?%Ys.4gp8l?3up83b$BA?+B?a+%"&d!Qafm_5l,f;7
/EE$-)jj;AB?a/"(V0.>>>Y6:h3*4Yg[#hO&qcAcX^o#&,dg^E7CI$?IW`iQ<0de='T?0CSS
/nHc>mr$:k@_PDp2d9J1i"(*0f:>uj,#kG'YP=\[OuK8&^U(s?l.B+]Ai4'+kO[l(1:J)]A\28
Fa;_"Z7*N#9S:hr\j7;774*Q&f.lV:jJh2rZCf<L7o/.p'^@XGU)]A_QqD4+65H*0,R$Y-ao6
.b]Al5meHNp#@Qh\E$mKV0^6.9^6r4625@lXi/T!3;eLL2Q\K(d/JA18Himnpla'4$PMYnK@e
CqA/;_1[#NY5-:B$aD_8uN3U8s[R:MeYnQc)QbnG@/$joY&@Ko!MIjRo5>iXq>.`%j-#'J+l
`=^+*PD>p\Z[O&PO)83,3Was/WZ'^38P\tElu!=L:4m)8/=GGU@LQ<AEXTj9F,A>Q9WfbfY3
d6j2kJ8\GPlN:>hhCADnhD>P+9:-OV\0'RXOU;'=5rqsnB=0SQ`O4IK`RQ"H$#bgYU$Lc*7&
7UOGu/_<'Fa*d)priJai)BW-I<7&gt3^DTaaXV%Acq$eX[k%f=dEu0G.QlI[S>el]AbH/l]Ad7
FoQJ(t_VuH+=Na#)]Ap5:6Y_t-;WGgT3@77JX/u_PJ0:T+I%e=CmhY*K2kj%mCk@Z-N9rI?iU
i)`dQe'k/!ot:J*toG9?KNbc*WWLG]A:urq-Bc"E^F+<=89m$tPc!'&lO2Gb$Dr;/0B'1e/bo
f2aJ;j^^eA8+KR-F&<fqX'!pX,#=5SUu0hT.aUuE0AKf./O9_H]A,!l,bp+[OTQ>NLdY]A(UtB
hjK/WB?*2O9oTq/4R?OH?ofL^$f8E;-h:Gp,@(?^K+AW]AJ&T<oGt?*&p"923V/$RU+;;qD-e
R'-7l62d+k1Jb^./=_+SMfL*:Qgb?gqi?/ha7\rn84g`rc#[+N+cXD^=m%D1%++@Jp!Yh$4k
-+2Zio<!V=X3AP08[TeQTN#`8a37&mK95X2^n&1GX[7r2l("1[p5N\NI6kZN&OOs?O`EkJoq
=]Ao,[J]AltS(a9Wa;W_84%_GU%_0l7=Gg(d?/`#Iq!5tu5P@cHG9>MLRE?&u(B?44\MYFuf4V
r.@@f%A^b6b`S5o5TU&(_'"'PXep6!PG3^*FIq9l#oq$(<6a&(cX`t0Hjh#1]AOcMMkI0k!K'
]A08A"m?e?@M!mGG>+!I4%Ot8`6h?<jLX43&0q(Mo\Nk!sZ[fqO:+90K>"4&]A>?@:t3]AX1MlC
C>gn&MpTU9c6<]A-T+^_g#,\G4C[ERb`ZbN+SH%QslBV,/kb\I,H?Ig,n-5HR3-$jbi@H9EVT
FPMH2H58of>!8^:Z*D5CA^DR?g:'LmV*ocilO/"XJOE^:Q%`jmR0pfYJnXJl9fe6ErXf]Ai?.
MVS;[F;<eO`a;),?$l2]A=,C,[UtWclW6$8=pb"/!F(#Qn_qI?=7QY]AGTWkfPXZa$r=.PYQr,
2Hf&,(F,N'u557YK('!-=0!QR#!LU[;F;$*<=8`3p:7C'&b4WO?MPHrY1%&4LT&:aQTqQMRO
FCp88)%iGJ$RR>M.1X<lKPl4//r72VF$KsDbP\==(aRuE-1.H%M=_j?D"L1\nA:\S,@Zhh7X
JcscE)/lMU9Bgr#?mk7SZO/:3<&2>Y939=jODk4uUZm8B>6W=3,8+1FKr1A5YM+;]A_9C2^!Q
J`/!6rZ[1&<h(l#7AY<%jSIFLr8^j/ulXDmmD^p(sH_'G^*s)ZNH*RCW7Mi.nbN)p,FYVZ&b
@LZ9,<;U['oUfSJ#gK[1gHSD3G23!T(cH@OhBr=AB.;\Kp#llU6sSLRW$MT/CO#&?gWlV#FC
GL5WD.nX*oLKf@G+7q8J"#m'[P?YKu1&gK3pGYIfhjL/XbgHY:Ng/2\1pp5qNY'slqi4ZU$;
44(`56pcGJi=N[c^FQh("EuOb(Mk%J]At(ZqhYhdqU<AsGcFc<3ZO6;Fn+.g5_(bYK8rDY$_(
88?,BQANT_%pBGQ:fZ8iQWIJdj$D:Po`@-"ZqqNDTP#+?j"ns3UOHKj0^i:i%1$D\ofD'A;a
r0>q^mmn796+/)]As]A&L+a[ddtc1FS'Bj@pKq?\q:B[/FpKFRd<r?4rD`SqeXIO)NI0OF//o,
pR]AqGX=Tao&qfC/loqM.$fN3394D>TCP8"EA,e[J^,?FpE#WlPiV>0lWoeV4J7ao;1aIS<q/
EJ+o-W$OT*jiC)71J!W2o5rs/T("XhePlm!aM.bfN<?Z4^nT_0;X?o+jLl+kD2S=#m1r&Q7%
nl"K=Z?L-p!sU)>es'kf=V1C@4)2PkjLV;0n#7_?>NY&#hce-qN+5cg#=.rs+KQZpF#cN?"u
O4e,msr^Xhb]A%3/NIgD0]A_o\CL%Q15lkD(Zs+`.Or[4c(t[L=8+R;CuMW:HQSO;,0r2ACg0[
8rZM+b(D,ik_e%$FI^Q`-rT'?1H#,giY8WG%R_(YlS;14Z&>5h;Jc\/)lpct_UB7NLP=)4lU
lethLR!(,GG,r)b-JTRkhP6h;r;#[A+"aXmCVM-+s>G^Aq9Z^^ntj2dZ3ptg8K3;*K&3UmAn
'1\9^Bj\,76*>Y%:3gq`%c"ad(+,hu4G#=F2'KV6TU+euK:TslINKNuD64TFRAVET5V>D:1W
5n-Jn8dMd;0&KX(#K_L6Gp!O[Cp*lnYAp<,LY\LhGOKZiJI7sPDalJ%\/b#G^]A+#j!MRe_Ml
5Y-^bGod*\`0?4pcCu^:+P7j#OO?`.e[O+_*]A!OX=YJa)WX;*j\K]A&$_c?8lCt7AVYS(rtPm
Q"H_1f?Yrt_>cU/_LL$sZ#BZV=$+lmQ1Y5Db?k.G!#e[M^`t-eg_7@aK8oKupb,d?5qs!p)n
_o8rY7UbrI$DmHl7]A8Gbrn65\dU6jWB?Z\D`_t5=npr)`=B1e3M.$$]A.9J'[__$K-n"/cUXd
>sG@&TI+c#EF_%aeI6SV(9Ro?)-*TOnR@Yr((537D/GBAa>_cP2n2F/)VIfZD4)fg#=7hl*s
?Ag>N7MB$-7+,ogXa2-#7!kab!`(U+3CG.o(7Y@\o>,l;J*nUWp9/]A6/g8:&&&G_g%B^S]A+N
uSo"PH6ro-JLnb;d5*e1,:`WM^[HU\6S:D+Db>pa_,Jqu0?gWHJ":'X4-8mL^J5o))ko)M.\
Lb!9K4(?hnhF7g0QV<2@GQT$E,]A9bQA>f9f$!)AbBs)b8H&"N0k8XW&%%!0]AJ?rJ0NaXhMj$
:?BgB+A0Y.;0/C=p=*4/mZ\0HWO>^H,S6o$5QFRQ\!QA5:e(]A=V)gJ1SQtL_7o:B6:)9XFp8
/Zl(9uV8R.TBi?Kfm<ALms#tJ7IfQ//#&_c&"<,UH\b.C-1gZ[A)jKOSVU_?u!8AFCuTBTh'
/0T;ZV]ABW]AbE,!eM2PNK*^Hg8pB"mQSEng%/;QH[1lBqnW2E:pT5E?QcA&)=cLs/[W]A1aL<g
DQtA2WrAZY>SO8Q#WJ5d2Hl'8.O-K+uA@NQ<bV$:QL5(n`>b`9k1PWr[$TkI.Ii%%ZV-9)TQ
d5Z6j8dkc9De:KBCHS1pfpMIKpDE#m_FYM?2e(6ga"QmE/Pq@(pfNB;Zgnj:SV42V'q&qYJL
Ve')-LEZ.<4^3lm:=)lm@:=2;O/@U`bd'BJr9@,6,&Vo<oXCm8pMh\^1`#RfJ';p>#nhf`lk
\*-1Aru]A%q4#+j[Y8[7Bd*EBCW7j:j!VD;4E#liFn)6Hg#q(#u<C4H2-)Dr-:b$E\$U;FklW
Th$#F"W7#4,>rd`O^)HYellFFf!<4ID?Bd2DQWd\8pu+RXYO)TeTnLWK*pT;q$[;$'bNd9%R
P^4^kDWS?\7>6QQ'2n*EU>X?'!,ZhRaEPY4Ke=ooiErqG_[:BVK+qgq0d4)#GJj?0"%6=+V@
i8AgI#lRYhC1H2He=YSB+T8)6#Zt=$>IaK)/8'uIMQ3kMickJPh%LQ]A*l2[@5U6b0F`?OkRC
O_7H<lHP:c$"W1B`IV@7r!3qB\=2a\m)ZuSu^>(>ADifYk!M*VUaHd`a@6CE'p_['U)WLHu/
D8[2.huZt+fIk'`MsHQej]A>Ri*VZgnd,K^du0"To,*T*QtG#L&goF.Yj.LZW28qc]A#dG]A&`=
a?<9N1hcA6l=D-R'VWMWDJGP_BUKbY8c&,GShp-TqE'utB7R^GN4sL8o3kr999`)J6HCb2<,
sfocpjl/Btfp>$m!/N-HU-^T5;Z#EWtUN6B_Cr]A?8bN1+Gua&TRUr2"lGp+B]AI\[(XM&<LiO
6Hn/V-:T1=]A5=XrbcN6"hmFmnk8;+dmTq0.qkQn]A<r^CAi;9oCr(U:djA6En3-.^Z3KMAiqH
#iQ>-YtcW[Sbh9c(_G[r$f1M'k;NhX=?3KKZlYYI=7]Aa61M"J?b^5kJ,;Tu%>Ua<XUnULS2R
Hm@I6atJ(""-!hbSkh06Z*cF*fQ]A1T9A8J&!'o"'nsKD%O\c_"#5kl.n'A9,^b6^?%`l4IA^
39E&n^(\pT;4/_T>N17uZ"X8DGKLF4F=Is!Ma,,t[86MQ;X2R+a0XVj<I4]A2,$S1:("p@GgL
&tg"#g_8<.#E9h7^>AIR0/`:[GPK%Km6+k&.@]AnnT3nGk[+>D_2[Fa2h8a2V#\4;(*'*c[f1
bYmQfTJ<u)%eX()!4[/[M(Gdr98c&A>9,8H>WJ-Suo]A\gYBX2$%#lW2c,j[/F>E()*Pu(/BQ
.SCmBHZ0@<f3\DVb9f'g>i$W^Vg1V_osZ^,ROZ<gc>3[=(Keg#s,![GH4"c(Wtmfr?3&>pQ"
NTD4Xj/AuX0h2VO[4PZh6KLQn6o"cLdnA`A2'IV@V\9F\7%oB@eJrRV'Z=!`2G*:Q+/Gb1/H
eC)"<+.a*WdSY36-BV^AS#2mna>LQ?J^b.MA%F7LKhj`/W=EB00H=Hlhq&"p_jjpbjfQ4`qu
!76i_6SE4JDEE0hQ,jaXHt+cSdSK]A8>Go3j2>qgT'8Ff^(BQq#2Bpo0'Up'$6;\MM?;Q+3B'
\."Ff!qBK=598m0fC:73r"a98J@mW=L$FcmZNa\>_]A`'_[*cUH#9KVmM2T*<$qieHM@rq;$:
GQV?Pu.__r@?jnk2FRr\F%$lpfjUO0tI<unX8&K2(5TK-)[TRfrpjlFS!^Gbb1#iC;=:^h9j
g?kI:I&bY>d3N2VjijM\Dko_#j!)?d*h"6ssuQ-R7c'U(Y'5lhL'nI'fud2\5ugJ'(tA=;=<
Ttc9M>W-KSd`p,^Jn-UCm(s!rM2EfhZ,qIfkGNTgH)HaX%PR5b*Z`kP[N,pjF-:-^jeHI;kF
ITT\+j4C2J''&X?oht-Og+(K-+tRHZ;W9CnaoMe'/S!T"-j]A5Ad=EmTIReAXn'obbu0QB]A=d
::c%bMO#<l_[`LG,_(@22c@7uWV,$W"/t="?F^:Bum"+J,f<fs&&VT<Nn5VaiE_mo3<p1&'%
2&Mi\0"G*0lhG<c#%>0oP3@ar6*938G79<,g^@e7<`sq[]AJ0f2:p=\PO8$IpKX:rp4*^G=(p
bDPZ:3ZQ'IX$e%F=5OumMaORo$OnXUDFLS*-VGTSE0g/9CjcVS`Ve'1l1MS10p>]AXepciqLn
F(<"p>Xp[:[-oCWXtkLJEb9G/Cir2&O;WEK,'s[mI9nmh,Y5SM>A?j.&@$SfF,P^)";`@q)N
=3DHp^M85P?2".Z(c/CL^/-=Q7%\nn7j_@mXG+[!hbJ55Tgc>VP'!Ia8,GFljK'jH(aj2DFj
d0b'NubTRnmZ;qN<,<JANm\H$i+-#J/b!Uld_fG>2%c<.hj:'k=p$=Y-Ccfn3[C9pnfh89Tk
lATsUS<Ub_K,Yo69T$07cEBYS\JNZfOJWG)K/Sfi+=(@D4\DoH/33O)Ie'UEI"!BTeN]Aq'`2
\K*NTr+.-'26I($er!HKa%ME/tM;4@k2;t`ZLb^/:[[%S?!6usf3DS5mZjcj;W:5#_af@fBL
Hpl:EYI\B='p76OdU-?c`j>X/S8%b3f:77;)+LCD]ASeWi7F96q0tf/.$NIcQEDEr!+nb*B6/
/oVP9K(ApJ^kRGa'BU>`GGgFN(khI\ce=K+N.GD7Ou*@^'PN/@VNnn/n&B8+&2WbG,`<If,8
)D5RECkOmFd`ASIIal#uJf3LHApid\0)BmK2ZH[GE3Hk5*#2$0^l+ARTpn8d!X.h2,3"Pi49
o-O#FT.+n\;L.uNof[hQ0`C&OY!S<Q))7#D3,nS9+>),FP^'#ZY#0P<hVNfV9ES`"+*VNMDE
Ljr'\Nq\0fiU>p>pZ<b*%:m%Gud>E%)W/AWU#YYTiPW@sKc7oM?fW]ABRrhtDI3B1CKYnV/4D
^t#0&KIHYIL0@gE:[DKd2Cr9!;lSYaN,1;98%k-,R/)hSfOgA"fKlisOkj4*,@31%2_Kj3kU
p7m,j)[G6X6NLp1b)mG-IO&$<K(i\-8u5@5D?N-Mh#^JE'mKhD:(ulVV;CN=:\YiinE9)K;%
Z2?Fm1>$'jg^XDZIeu`<;]A&;pY!$E?)A4L5:2*4;,=5XEP[,jI:-MZ<j+CkOcgCI=H=&k>VK
YMQCUg7mWb\H&4)g'1T')So?;UY2H/0E]A2`]AEJ3.rd);E&VT+XWKP25]A9VEB8t-k+EgggQW&
&"c\k<@8MXV1/VQ^;9-%iOe2@>i`5sW]A:lc!B"OZ'K88uNo[p>-o$2(;/PAS*h4dDL?NGNK7
Xj<aViJ>sT<Upm[U_@[gDA!;F^QPN=e<*O.@ABG^mr:LbC0^38``N/<2==p]Ap:TIreL0cjjG
D53TO=j#%.\jO_\(WJl7-_Z`V]A;m#tgfZ>M-Uj4-U<`hF/9eTCqjHWEt]A'0_@t\0d#_lI<MC
p7E7;=R7Pa,iH5Uqi\sTZ>.?\2iG;l59KF.J,2q7qEDl;>@@q0KI43rt9aA>Lj_k*0Nc/51^
L.Qc;5)&QZK_,,kaVB*ds#+@)FPGIr1=2'-pBW(5&r\%il[,Vc=e*n`1dfI.`fNRo*FiZ=^X
[l$d(P)PK/`JV_?=cn(?9oYbDbk/=uJ==!.D1*"DcAW'io4c/C"(p>/B,Jk"Du#-M`Eg=V)J
@VN<b;00A3BNcIG:u!SSo=N]Aj8;g`L_fgRTib[\8%7Fft(%?Rb'&P7nl1#,pao-$kSN?N%L3
q/4?O#E\)*5F,2(=r\^Mrp'r^lMeNu!Xe!scc(CE(>X[!e#ocA==5rY)ANnD*\caX:DpcX8q
no^pZ'*KL/6^(]A8[/p'[_WR&[HnKk[-B0#lj&VI`1e%I!@N0S:qP`uR[3pT!IqHY'u1cJ[%k
%0'h0(hA$2T>;&Y#spSQg<t6S7_=TE^&!8/.Lm`S/&8#,IMf*k',0gPsn6Ini,3f'.,?uCNd
k?4Y14orO]A+mWU;m_X]A'Q)Im9UWJ^%ea?0dNpe'o653_`s/0%7Qn:J=.:,)+jF(CuOlNNJ8W
r@d>Eg:f#s$:@8j(i4Yf#`Gg9>hI=L>W0pJ=kV(G9f&`W2)=AC9\JDkU0m/%`3^9a[kojp[e
V_6"uJ)gi?+(c^qEoX$9$qa#3N?/"nX\`?%g2G-%iD8`ifUL?MIPk_csq4i50Ha&Jr.R9<#@
SbBm9@eX<-sfLN2iUZgunO(,;Y%5YkQhPetkTRA!V/Wpu\Y6H)q+P.UkD^RRC=0hbia#:rO(
u1P%qG$aEpJ)%inQIWo)*;6B[qcSX-jPZ3HprG)GLeVbm7T:FG`H0F4@\g#SVKGq>DK1tr^@
Nk-tJZ_jll/D/gg!smNk?'\<8T.%bseGaI>oia@dAXf#A2'k[O4d[%@]ATnFr_R=7Aoac!pn`
b\!q_3,<Cbb9HeYc26e,.`YMoiB,777(D`7haZT%Y8W++,$<go<r09bbX"iC'a`40K!R=obN
qXG`]A/N`ccQ'aq/=XA;b9jQ(tY?IkZ6IpRJ:T3DWb?=qhcL[4b"CBq*A1IeZ[;E<kA,%c?P^
LRqG3*gdhn,PHHc50g#cDmeT!V</LN`lMCDLF,s60YoVP8^C%87G@RX&?BeKnUm>-umgER6Z
p6.RS&E,>%K#42`UH3us3f..!OuMq1-/e&,;`W)8X2+ob0ik7.5gR2`%6#1m`H&o_fP>O&ln
_@8cWrTr.TA4\s']A2$f0Df\Rj`5pl$ZF(t>,L:AIs9]AKp%5k-hfS`^_2snqGdjY%g/bMTU^L
4f2WBG`VH!?'4_J8s0-eSVLZcl'KdF+eK"(,BAOt<@btP<P2fqjuG@Nm#_s+q*"?!EbZiOG+
YeGj$6P-qM1n$>9e5pcMG&i;V))FAFS-U_!'NKaDLPG=c(&2cF$s[er/jX9MMfhg@E\a!+)W
M/ck4Zb.*+^kBmE)>EO?6`Fe@.E)W)l$^7:ZJZ3rc@6"6mRPcL>;]AVSLX9oPG2S>Zja04*Ao
imjDpp[PpK!RLo4tTk\Hf!hiQ2lj78)Gh2*D@jJoDEEI/_:5dm2nVs8"0Eh>j2QI$)Rr[&f!
hKF?;OlI!bsURBl6o4>#-ej>S\XV7;0#Z/)mW#+.5!r1Z>ZNE_'=37<;DE.;:FV3d3^I%U:p
=&[/%Osur-o:<\A:LAMpSUGr4;<s9CBOD`"H3H((;([`bX8cC6$V'Jk)WVm_L&#dihu\]A/HT
7$G&OG4<X8-(%N4C\,,#%3Ea*,XpqDlo>BHJr]Ak\[bc>(!*gNPF=:O"&+9[VQ30QE;4L's&V
mGoC3r&)#u(6[c-I(aHEQPPl^9-@-8O/)j2@"V9[qp+Ka;9H5W]AT>u1o>-+AF`TL^KJO`#UM
eqL5k<d>JKdDW>2Uhc(]AA.,t)`If<anR!0J0]A2"BEeX_#9>+?9G8V]AF(XcC_fB)[a.2iaTR8
0BX[U>9E]AL;idU'4o(]A14QqrtM&S7[cEg,@7^[i[?50k686ZE@jcHG>=;09*Hh@dC4EP8aQU
YNA4AF77hZBA_fjkW(N8I#:41ieBP#[UukI[A;UG0#o==lsGGf[U*o*2NGm#2'+1gFrVtRFZ
eunA0ua3]A\=U=AB_E;Knf>UDq\cXfO]AUM+.4sl7Blc3lA'P*81AXUr^;Z#"lp`+.eGu92]A7`
1#F3<l_:S2r#euhk(Xcga#]AS]A4@0PE8Q@jbOGAZR]A48>c$rI9o6Yd72KbjE]A#cl^j5=0J3t=
t54Sn&>tXJpWI*&M:0[s8?.nSnT'U<iauirI4~
]]></IM>
</FRImage>
</Background>
<Alpha alpha="1.0"/>
</Border>
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="2">
<FRImage fm="png">
<IM>
<![CDATA[m<IeQ*74C;Om"ZY&knAuU:2OZe<$WH.+)h[M)&8AM'+'I7'ro?LT&US&V?sVNR!4)b96YK0l
QKns2=fnpYkI]Af!EZUHgQ7,HM6%<HQrW03bhE)&eYhgB0)L$,UB2Ps7VG:jSs%<kT<D0P'b?
t1tBCX3W$?d7c9]AC"+A46b_^aC:FT8Ng<M-[3K$."4mtCh"IA.V)ANEJ;cCsol,as(#iGOYn
:R3RS%BT25rl%PrJY>YSAMJ;]APOXS<uiGA4/O#5kH?pu7e`CMQTMKCY_d8C$O,a_*HUiqc]A$
u,FaKdEo.N]A_;Gfi[qMaf.:F>UphK'd*5J2t%3dLts3tA>djF//`BY=Y;rK\c\&XWr,GI9DL
[,3*05UlChKmu!J4;6jr]A21H0^".mQ(*#JH$c(;oK09mS98k+QM&)/\Us]A%D4'oRp:I7:Zot
[Wp/T[#9_e_(%e>T]AelQf-Y"27QLj5N8[j-,Y6i6LA/Y#Y>DGb!fpZfXo(N\lcoRP+&rgF)d
>h44->n%8Km/1uS[_Wb5i`KK4f,k_jr*RB'MEVQADL]A"eEjasdk.luk,#laHAn[KWM?]A%j.[
//M&@"GnEOa85C)?P-Xj7OrcO?`1Af?%Ys.4gp8l?3up83b$BA?+B?a+%"&d!Qafm_5l,f;7
/EE$-)jj;AB?a/"(V0.>>>Y6:h3*4Yg[#hO&qcAcX^o#&,dg^E7CI$?IW`iQ<0de='T?0CSS
/nHc>mr$:k@_PDp2d9J1i"(*0f:>uj,#kG'YP=\[OuK8&^U(s?l.B+]Ai4'+kO[l(1:J)]A\28
Fa;_"Z7*N#9S:hr\j7;774*Q&f.lV:jJh2rZCf<L7o/.p'^@XGU)]A_QqD4+65H*0,R$Y-ao6
.b]Al5meHNp#@Qh\E$mKV0^6.9^6r4625@lXi/T!3;eLL2Q\K(d/JA18Himnpla'4$PMYnK@e
CqA/;_1[#NY5-:B$aD_8uN3U8s[R:MeYnQc)QbnG@/$joY&@Ko!MIjRo5>iXq>.`%j-#'J+l
`=^+*PD>p\Z[O&PO)83,3Was/WZ'^38P\tElu!=L:4m)8/=GGU@LQ<AEXTj9F,A>Q9WfbfY3
d6j2kJ8\GPlN:>hhCADnhD>P+9:-OV\0'RXOU;'=5rqsnB=0SQ`O4IK`RQ"H$#bgYU$Lc*7&
7UOGu/_<'Fa*d)priJai)BW-I<7&gt3^DTaaXV%Acq$eX[k%f=dEu0G.QlI[S>el]AbH/l]Ad7
FoQJ(t_VuH+=Na#)]Ap5:6Y_t-;WGgT3@77JX/u_PJ0:T+I%e=CmhY*K2kj%mCk@Z-N9rI?iU
i)`dQe'k/!ot:J*toG9?KNbc*WWLG]A:urq-Bc"E^F+<=89m$tPc!'&lO2Gb$Dr;/0B'1e/bo
f2aJ;j^^eA8+KR-F&<fqX'!pX,#=5SUu0hT.aUuE0AKf./O9_H]A,!l,bp+[OTQ>NLdY]A(UtB
hjK/WB?*2O9oTq/4R?OH?ofL^$f8E;-h:Gp,@(?^K+AW]AJ&T<oGt?*&p"923V/$RU+;;qD-e
R'-7l62d+k1Jb^./=_+SMfL*:Qgb?gqi?/ha7\rn84g`rc#[+N+cXD^=m%D1%++@Jp!Yh$4k
-+2Zio<!V=X3AP08[TeQTN#`8a37&mK95X2^n&1GX[7r2l("1[p5N\NI6kZN&OOs?O`EkJoq
=]Ao,[J]AltS(a9Wa;W_84%_GU%_0l7=Gg(d?/`#Iq!5tu5P@cHG9>MLRE?&u(B?44\MYFuf4V
r.@@f%A^b6b`S5o5TU&(_'"'PXep6!PG3^*FIq9l#oq$(<6a&(cX`t0Hjh#1]AOcMMkI0k!K'
]A08A"m?e?@M!mGG>+!I4%Ot8`6h?<jLX43&0q(Mo\Nk!sZ[fqO:+90K>"4&]A>?@:t3]AX1MlC
C>gn&MpTU9c6<]A-T+^_g#,\G4C[ERb`ZbN+SH%QslBV,/kb\I,H?Ig,n-5HR3-$jbi@H9EVT
FPMH2H58of>!8^:Z*D5CA^DR?g:'LmV*ocilO/"XJOE^:Q%`jmR0pfYJnXJl9fe6ErXf]Ai?.
MVS;[F;<eO`a;),?$l2]A=,C,[UtWclW6$8=pb"/!F(#Qn_qI?=7QY]AGTWkfPXZa$r=.PYQr,
2Hf&,(F,N'u557YK('!-=0!QR#!LU[;F;$*<=8`3p:7C'&b4WO?MPHrY1%&4LT&:aQTqQMRO
FCp88)%iGJ$RR>M.1X<lKPl4//r72VF$KsDbP\==(aRuE-1.H%M=_j?D"L1\nA:\S,@Zhh7X
JcscE)/lMU9Bgr#?mk7SZO/:3<&2>Y939=jODk4uUZm8B>6W=3,8+1FKr1A5YM+;]A_9C2^!Q
J`/!6rZ[1&<h(l#7AY<%jSIFLr8^j/ulXDmmD^p(sH_'G^*s)ZNH*RCW7Mi.nbN)p,FYVZ&b
@LZ9,<;U['oUfSJ#gK[1gHSD3G23!T(cH@OhBr=AB.;\Kp#llU6sSLRW$MT/CO#&?gWlV#FC
GL5WD.nX*oLKf@G+7q8J"#m'[P?YKu1&gK3pGYIfhjL/XbgHY:Ng/2\1pp5qNY'slqi4ZU$;
44(`56pcGJi=N[c^FQh("EuOb(Mk%J]At(ZqhYhdqU<AsGcFc<3ZO6;Fn+.g5_(bYK8rDY$_(
88?,BQANT_%pBGQ:fZ8iQWIJdj$D:Po`@-"ZqqNDTP#+?j"ns3UOHKj0^i:i%1$D\ofD'A;a
r0>q^mmn796+/)]As]A&L+a[ddtc1FS'Bj@pKq?\q:B[/FpKFRd<r?4rD`SqeXIO)NI0OF//o,
pR]AqGX=Tao&qfC/loqM.$fN3394D>TCP8"EA,e[J^,?FpE#WlPiV>0lWoeV4J7ao;1aIS<q/
EJ+o-W$OT*jiC)71J!W2o5rs/T("XhePlm!aM.bfN<?Z4^nT_0;X?o+jLl+kD2S=#m1r&Q7%
nl"K=Z?L-p!sU)>es'kf=V1C@4)2PkjLV;0n#7_?>NY&#hce-qN+5cg#=.rs+KQZpF#cN?"u
O4e,msr^Xhb]A%3/NIgD0]A_o\CL%Q15lkD(Zs+`.Or[4c(t[L=8+R;CuMW:HQSO;,0r2ACg0[
8rZM+b(D,ik_e%$FI^Q`-rT'?1H#,giY8WG%R_(YlS;14Z&>5h;Jc\/)lpct_UB7NLP=)4lU
lethLR!(,GG,r)b-JTRkhP6h;r;#[A+"aXmCVM-+s>G^Aq9Z^^ntj2dZ3ptg8K3;*K&3UmAn
'1\9^Bj\,76*>Y%:3gq`%c"ad(+,hu4G#=F2'KV6TU+euK:TslINKNuD64TFRAVET5V>D:1W
5n-Jn8dMd;0&KX(#K_L6Gp!O[Cp*lnYAp<,LY\LhGOKZiJI7sPDalJ%\/b#G^]A+#j!MRe_Ml
5Y-^bGod*\`0?4pcCu^:+P7j#OO?`.e[O+_*]A!OX=YJa)WX;*j\K]A&$_c?8lCt7AVYS(rtPm
Q"H_1f?Yrt_>cU/_LL$sZ#BZV=$+lmQ1Y5Db?k.G!#e[M^`t-eg_7@aK8oKupb,d?5qs!p)n
_o8rY7UbrI$DmHl7]A8Gbrn65\dU6jWB?Z\D`_t5=npr)`=B1e3M.$$]A.9J'[__$K-n"/cUXd
>sG@&TI+c#EF_%aeI6SV(9Ro?)-*TOnR@Yr((537D/GBAa>_cP2n2F/)VIfZD4)fg#=7hl*s
?Ag>N7MB$-7+,ogXa2-#7!kab!`(U+3CG.o(7Y@\o>,l;J*nUWp9/]A6/g8:&&&G_g%B^S]A+N
uSo"PH6ro-JLnb;d5*e1,:`WM^[HU\6S:D+Db>pa_,Jqu0?gWHJ":'X4-8mL^J5o))ko)M.\
Lb!9K4(?hnhF7g0QV<2@GQT$E,]A9bQA>f9f$!)AbBs)b8H&"N0k8XW&%%!0]AJ?rJ0NaXhMj$
:?BgB+A0Y.;0/C=p=*4/mZ\0HWO>^H,S6o$5QFRQ\!QA5:e(]A=V)gJ1SQtL_7o:B6:)9XFp8
/Zl(9uV8R.TBi?Kfm<ALms#tJ7IfQ//#&_c&"<,UH\b.C-1gZ[A)jKOSVU_?u!8AFCuTBTh'
/0T;ZV]ABW]AbE,!eM2PNK*^Hg8pB"mQSEng%/;QH[1lBqnW2E:pT5E?QcA&)=cLs/[W]A1aL<g
DQtA2WrAZY>SO8Q#WJ5d2Hl'8.O-K+uA@NQ<bV$:QL5(n`>b`9k1PWr[$TkI.Ii%%ZV-9)TQ
d5Z6j8dkc9De:KBCHS1pfpMIKpDE#m_FYM?2e(6ga"QmE/Pq@(pfNB;Zgnj:SV42V'q&qYJL
Ve')-LEZ.<4^3lm:=)lm@:=2;O/@U`bd'BJr9@,6,&Vo<oXCm8pMh\^1`#RfJ';p>#nhf`lk
\*-1Aru]A%q4#+j[Y8[7Bd*EBCW7j:j!VD;4E#liFn)6Hg#q(#u<C4H2-)Dr-:b$E\$U;FklW
Th$#F"W7#4,>rd`O^)HYellFFf!<4ID?Bd2DQWd\8pu+RXYO)TeTnLWK*pT;q$[;$'bNd9%R
P^4^kDWS?\7>6QQ'2n*EU>X?'!,ZhRaEPY4Ke=ooiErqG_[:BVK+qgq0d4)#GJj?0"%6=+V@
i8AgI#lRYhC1H2He=YSB+T8)6#Zt=$>IaK)/8'uIMQ3kMickJPh%LQ]A*l2[@5U6b0F`?OkRC
O_7H<lHP:c$"W1B`IV@7r!3qB\=2a\m)ZuSu^>(>ADifYk!M*VUaHd`a@6CE'p_['U)WLHu/
D8[2.huZt+fIk'`MsHQej]A>Ri*VZgnd,K^du0"To,*T*QtG#L&goF.Yj.LZW28qc]A#dG]A&`=
a?<9N1hcA6l=D-R'VWMWDJGP_BUKbY8c&,GShp-TqE'utB7R^GN4sL8o3kr999`)J6HCb2<,
sfocpjl/Btfp>$m!/N-HU-^T5;Z#EWtUN6B_Cr]A?8bN1+Gua&TRUr2"lGp+B]AI\[(XM&<LiO
6Hn/V-:T1=]A5=XrbcN6"hmFmnk8;+dmTq0.qkQn]A<r^CAi;9oCr(U:djA6En3-.^Z3KMAiqH
#iQ>-YtcW[Sbh9c(_G[r$f1M'k;NhX=?3KKZlYYI=7]Aa61M"J?b^5kJ,;Tu%>Ua<XUnULS2R
Hm@I6atJ(""-!hbSkh06Z*cF*fQ]A1T9A8J&!'o"'nsKD%O\c_"#5kl.n'A9,^b6^?%`l4IA^
39E&n^(\pT;4/_T>N17uZ"X8DGKLF4F=Is!Ma,,t[86MQ;X2R+a0XVj<I4]A2,$S1:("p@GgL
&tg"#g_8<.#E9h7^>AIR0/`:[GPK%Km6+k&.@]AnnT3nGk[+>D_2[Fa2h8a2V#\4;(*'*c[f1
bYmQfTJ<u)%eX()!4[/[M(Gdr98c&A>9,8H>WJ-Suo]A\gYBX2$%#lW2c,j[/F>E()*Pu(/BQ
.SCmBHZ0@<f3\DVb9f'g>i$W^Vg1V_osZ^,ROZ<gc>3[=(Keg#s,![GH4"c(Wtmfr?3&>pQ"
NTD4Xj/AuX0h2VO[4PZh6KLQn6o"cLdnA`A2'IV@V\9F\7%oB@eJrRV'Z=!`2G*:Q+/Gb1/H
eC)"<+.a*WdSY36-BV^AS#2mna>LQ?J^b.MA%F7LKhj`/W=EB00H=Hlhq&"p_jjpbjfQ4`qu
!76i_6SE4JDEE0hQ,jaXHt+cSdSK]A8>Go3j2>qgT'8Ff^(BQq#2Bpo0'Up'$6;\MM?;Q+3B'
\."Ff!qBK=598m0fC:73r"a98J@mW=L$FcmZNa\>_]A`'_[*cUH#9KVmM2T*<$qieHM@rq;$:
GQV?Pu.__r@?jnk2FRr\F%$lpfjUO0tI<unX8&K2(5TK-)[TRfrpjlFS!^Gbb1#iC;=:^h9j
g?kI:I&bY>d3N2VjijM\Dko_#j!)?d*h"6ssuQ-R7c'U(Y'5lhL'nI'fud2\5ugJ'(tA=;=<
Ttc9M>W-KSd`p,^Jn-UCm(s!rM2EfhZ,qIfkGNTgH)HaX%PR5b*Z`kP[N,pjF-:-^jeHI;kF
ITT\+j4C2J''&X?oht-Og+(K-+tRHZ;W9CnaoMe'/S!T"-j]A5Ad=EmTIReAXn'obbu0QB]A=d
::c%bMO#<l_[`LG,_(@22c@7uWV,$W"/t="?F^:Bum"+J,f<fs&&VT<Nn5VaiE_mo3<p1&'%
2&Mi\0"G*0lhG<c#%>0oP3@ar6*938G79<,g^@e7<`sq[]AJ0f2:p=\PO8$IpKX:rp4*^G=(p
bDPZ:3ZQ'IX$e%F=5OumMaORo$OnXUDFLS*-VGTSE0g/9CjcVS`Ve'1l1MS10p>]AXepciqLn
F(<"p>Xp[:[-oCWXtkLJEb9G/Cir2&O;WEK,'s[mI9nmh,Y5SM>A?j.&@$SfF,P^)";`@q)N
=3DHp^M85P?2".Z(c/CL^/-=Q7%\nn7j_@mXG+[!hbJ55Tgc>VP'!Ia8,GFljK'jH(aj2DFj
d0b'NubTRnmZ;qN<,<JANm\H$i+-#J/b!Uld_fG>2%c<.hj:'k=p$=Y-Ccfn3[C9pnfh89Tk
lATsUS<Ub_K,Yo69T$07cEBYS\JNZfOJWG)K/Sfi+=(@D4\DoH/33O)Ie'UEI"!BTeN]Aq'`2
\K*NTr+.-'26I($er!HKa%ME/tM;4@k2;t`ZLb^/:[[%S?!6usf3DS5mZjcj;W:5#_af@fBL
Hpl:EYI\B='p76OdU-?c`j>X/S8%b3f:77;)+LCD]ASeWi7F96q0tf/.$NIcQEDEr!+nb*B6/
/oVP9K(ApJ^kRGa'BU>`GGgFN(khI\ce=K+N.GD7Ou*@^'PN/@VNnn/n&B8+&2WbG,`<If,8
)D5RECkOmFd`ASIIal#uJf3LHApid\0)BmK2ZH[GE3Hk5*#2$0^l+ARTpn8d!X.h2,3"Pi49
o-O#FT.+n\;L.uNof[hQ0`C&OY!S<Q))7#D3,nS9+>),FP^'#ZY#0P<hVNfV9ES`"+*VNMDE
Ljr'\Nq\0fiU>p>pZ<b*%:m%Gud>E%)W/AWU#YYTiPW@sKc7oM?fW]ABRrhtDI3B1CKYnV/4D
^t#0&KIHYIL0@gE:[DKd2Cr9!;lSYaN,1;98%k-,R/)hSfOgA"fKlisOkj4*,@31%2_Kj3kU
p7m,j)[G6X6NLp1b)mG-IO&$<K(i\-8u5@5D?N-Mh#^JE'mKhD:(ulVV;CN=:\YiinE9)K;%
Z2?Fm1>$'jg^XDZIeu`<;]A&;pY!$E?)A4L5:2*4;,=5XEP[,jI:-MZ<j+CkOcgCI=H=&k>VK
YMQCUg7mWb\H&4)g'1T')So?;UY2H/0E]A2`]AEJ3.rd);E&VT+XWKP25]A9VEB8t-k+EgggQW&
&"c\k<@8MXV1/VQ^;9-%iOe2@>i`5sW]A:lc!B"OZ'K88uNo[p>-o$2(;/PAS*h4dDL?NGNK7
Xj<aViJ>sT<Upm[U_@[gDA!;F^QPN=e<*O.@ABG^mr:LbC0^38``N/<2==p]Ap:TIreL0cjjG
D53TO=j#%.\jO_\(WJl7-_Z`V]A;m#tgfZ>M-Uj4-U<`hF/9eTCqjHWEt]A'0_@t\0d#_lI<MC
p7E7;=R7Pa,iH5Uqi\sTZ>.?\2iG;l59KF.J,2q7qEDl;>@@q0KI43rt9aA>Lj_k*0Nc/51^
L.Qc;5)&QZK_,,kaVB*ds#+@)FPGIr1=2'-pBW(5&r\%il[,Vc=e*n`1dfI.`fNRo*FiZ=^X
[l$d(P)PK/`JV_?=cn(?9oYbDbk/=uJ==!.D1*"DcAW'io4c/C"(p>/B,Jk"Du#-M`Eg=V)J
@VN<b;00A3BNcIG:u!SSo=N]Aj8;g`L_fgRTib[\8%7Fft(%?Rb'&P7nl1#,pao-$kSN?N%L3
q/4?O#E\)*5F,2(=r\^Mrp'r^lMeNu!Xe!scc(CE(>X[!e#ocA==5rY)ANnD*\caX:DpcX8q
no^pZ'*KL/6^(]A8[/p'[_WR&[HnKk[-B0#lj&VI`1e%I!@N0S:qP`uR[3pT!IqHY'u1cJ[%k
%0'h0(hA$2T>;&Y#spSQg<t6S7_=TE^&!8/.Lm`S/&8#,IMf*k',0gPsn6Ini,3f'.,?uCNd
k?4Y14orO]A+mWU;m_X]A'Q)Im9UWJ^%ea?0dNpe'o653_`s/0%7Qn:J=.:,)+jF(CuOlNNJ8W
r@d>Eg:f#s$:@8j(i4Yf#`Gg9>hI=L>W0pJ=kV(G9f&`W2)=AC9\JDkU0m/%`3^9a[kojp[e
V_6"uJ)gi?+(c^qEoX$9$qa#3N?/"nX\`?%g2G-%iD8`ifUL?MIPk_csq4i50Ha&Jr.R9<#@
SbBm9@eX<-sfLN2iUZgunO(,;Y%5YkQhPetkTRA!V/Wpu\Y6H)q+P.UkD^RRC=0hbia#:rO(
u1P%qG$aEpJ)%inQIWo)*;6B[qcSX-jPZ3HprG)GLeVbm7T:FG`H0F4@\g#SVKGq>DK1tr^@
Nk-tJZ_jll/D/gg!smNk?'\<8T.%bseGaI>oia@dAXf#A2'k[O4d[%@]ATnFr_R=7Aoac!pn`
b\!q_3,<Cbb9HeYc26e,.`YMoiB,777(D`7haZT%Y8W++,$<go<r09bbX"iC'a`40K!R=obN
qXG`]A/N`ccQ'aq/=XA;b9jQ(tY?IkZ6IpRJ:T3DWb?=qhcL[4b"CBq*A1IeZ[;E<kA,%c?P^
LRqG3*gdhn,PHHc50g#cDmeT!V</LN`lMCDLF,s60YoVP8^C%87G@RX&?BeKnUm>-umgER6Z
p6.RS&E,>%K#42`UH3us3f..!OuMq1-/e&,;`W)8X2+ob0ik7.5gR2`%6#1m`H&o_fP>O&ln
_@8cWrTr.TA4\s']A2$f0Df\Rj`5pl$ZF(t>,L:AIs9]AKp%5k-hfS`^_2snqGdjY%g/bMTU^L
4f2WBG`VH!?'4_J8s0-eSVLZcl'KdF+eK"(,BAOt<@btP<P2fqjuG@Nm#_s+q*"?!EbZiOG+
YeGj$6P-qM1n$>9e5pcMG&i;V))FAFS-U_!'NKaDLPG=c(&2cF$s[er/jX9MMfhg@E\a!+)W
M/ck4Zb.*+^kBmE)>EO?6`Fe@.E)W)l$^7:ZJZ3rc@6"6mRPcL>;]AVSLX9oPG2S>Zja04*Ao
imjDpp[PpK!RLo4tTk\Hf!hiQ2lj78)Gh2*D@jJoDEEI/_:5dm2nVs8"0Eh>j2QI$)Rr[&f!
hKF?;OlI!bsURBl6o4>#-ej>S\XV7;0#Z/)mW#+.5!r1Z>ZNE_'=37<;DE.;:FV3d3^I%U:p
=&[/%Osur-o:<\A:LAMpSUGr4;<s9CBOD`"H3H((;([`bX8cC6$V'Jk)WVm_L&#dihu\]A/HT
7$G&OG4<X8-(%N4C\,,#%3Ea*,XpqDlo>BHJr]Ak\[bc>(!*gNPF=:O"&+9[VQ30QE;4L's&V
mGoC3r&)#u(6[c-I(aHEQPPl^9-@-8O/)j2@"V9[qp+Ka;9H5W]AT>u1o>-+AF`TL^KJO`#UM
eqL5k<d>JKdDW>2Uhc(]AA.,t)`If<anR!0J0]A2"BEeX_#9>+?9G8V]AF(XcC_fB)[a.2iaTR8
0BX[U>9E]AL;idU'4o(]A14QqrtM&S7[cEg,@7^[i[?50k686ZE@jcHG>=;09*Hh@dC4EP8aQU
YNA4AF77hZBA_fjkW(N8I#:41ieBP#[UukI[A;UG0#o==lsGGf[U*o*2NGm#2'+1gFrVtRFZ
eunA0ua3]A\=U=AB_E;Knf>UDq\cXfO]AUM+.4sl7Blc3lA'P*81AXUr^;Z#"lp`+.eGu92]A7`
1#F3<l_:S2r#euhk(Xcga#]AS]A4@0PE8Q@jbOGAZR]A48>c$rI9o6Yd72KbjE]A#cl^j5=0J3t=
t54Sn&>tXJpWI*&M:0[s8?.nSnT'U<iauirI4~
]]></IM>
</FRImage>
</Background>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[288000,864000,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[152400,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="1" s="0">
<O>
<![CDATA[应收]]></O>
<PrivilegeControl/>
<Expand/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList>
<Style horizontal_alignment="2" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="104" foreground="-526345"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m9=p6;cam8lO7s=8undlK#FfBknXF7Q)#]At'j!iUf[=&Q+Jol*>(e`.(d_OjCONTU8lL_88B
N-^XU$E_0a(%J85'+R6&iO?Q:/SO&je53\MmuufQ1\9'R-Fs5Kqo(cT0nYIc'ns*r"ab4/CE
UVYEjTnF2e\Z"@RCLW:[!LW:KaTD+#2oYt46H$G"FNEEahmjZ,f[W`C[+\C)-9Cq\?64VV>$
HJ$:Ht-[\Vj:l=rSr+j]ApTbbW0a+5Fk'+IW[>"-?7C`8XdEQ.LgVo83=N@L!HDDN,._pLjj\
S'Dir]A88YT-&)Y:QZc+C)NfO#:),"6olU4qni#S*H!DATVX$pS!Hn""M3lnn^<`.hDur7r7*
%/LJ<P?sA@OBKqqHcrr)Z`_ETRsY+e")[!-mY06Z31FKn7/)$&9dEi(dit*_-.,-D"r*r2N(
jsGZuMG28X`rA!TqY'Fc+Mt;'2@a&=oR_YlimX'M%:,YmstaM:Yf4QuS@?X2LMIlIsE\e$=0
!*CFi#2or(oJ[d9l.`D[)H;r0q),?Z@S%hs8*O,qZDX9DNW00$=FtL/hN2_YA]At;'bQ]AekNJ
8sGWY&VQS!E\m=>_t!(2kIQhW0VETB<L'j>K\?^`Lg@mG&\-`b=JPJB^Ilk2HINjMX:D%!mf
rSY!aujhkSiK;qOt;-I!8"F]ALoDiXP[4\*:dm!p9.'/U=@WZl:Gkh1N2I20s"8<tWgq2;B69
OCbGEhbW9V\/6;j\'hl.0;&4H(B6)?eJiq/aA,6@7=c(5o($L<Ga3N-BVl3I.psf9K;`Sig;
mq^B]A8(@mDYhYK[F2;VoWg9%AB!;Mom7>:fM@)A,s5eXAh;lOX5[u_^5\DZ>EEpb>tj+7#GI
5/nK<4$`p<s^:16&g9+>jl-25g/8l6(PR?O+'2dR3m827NCfodtU:LQ"4Wif$j]Ao9LR@&>IQ
/tl.hGqHjpDJ`j0>7aWW6URca(fRf+It\0Jn2#BS3]A]AH`u4SKR')%0H2V>.L=%&HQ$<8o^TN
iF^N'6f\\VdOq:0:C)aSN,54$-1OYul3=-(ORYq8E*Li'gMV9md=``p-h_]A7VRQA%*\ib'Ys
>l4SNMu\7kCs;'kK([]ATMLuG\77\!H`j77iTeucJc4W`:W*ucVf6>7B(T\=Uq,KCac3#9YQR
dl&Y%pS$eiL&O@]A)cZZ<EM^105"6dD8as3B/BC1:9SK'qlA&"_ZMtWXCjNff@hH,Tq0\%Yr+
P1Y7Uo7na"NZ:a<@4Yq5,:XGD1E^a+4fbc5@LfA`f8TKT/B.;"^<@QM`<@UN(N]A,I\F??iW.
J:p1Z!'&UU*^K'A5)qO>-;fI8O&u=DB0N]AHe/(inUY>rP:P!88,V,TKh(1^[H00P9-N=Vf&l
8HWPou;d>%0.?Ku.qm]AAf^VGZ+59`:CX\c?&jXGJkbpHr)ccmkOK#Ad=P=4X&%"."LB6HY\@
cdh9VTge%,E4b&=_7K@e91U&"UJDbs07u_jh*Lfk:P?&[6+-<]Ao.L=@=:N7o=VZ6DRD<eoOH
Y="><@$";T%mrfFBc->us_$<.Y:8o\_H1-k+]A^,a2:gagLA'K"O.K,E#XRfDOj>D'Brf3:n=
/-f`If\2\'rQ@[e=+nGl?g+UEEPIegiJ"%aPg0/G-]A]A"[;put%^hH%N>^"+#OZ+O0#F;Ra[$
$=461Md)X2VUH6C_ueWRHk\r%p1d6M8aJJ/iRA?,g//&#j#)XQ6[7"LO[J.2VV4R,0[=/L[j
!;lFVrWgJ/<tP8KprN)DF,ef'm&b]A,66jMm_A&I]ADlj%$^r1C$9s,XWOpM\0rMK\PCmBli/L
%)NE?#+lsdQ&;#MYlDRa%$s8Y%p;GH2T7cMJHu8$PUjneOg_d'JO,CU^gl_:CfG^(k\,<$W.
KnO(%9\1V.S5t&FX^m7XTtBB`21?!cK#4T6iRkjnIPE:$FF!d@m/2D&b&ZO';I09`.?#T2!d
n@ER_r"CeZUX7[>"<K)01W:@@8Y\G_+h)TnSDF[?&&cGXC&r>,ENn005`@ZNdN?A#t5J#1h3
`I)tdo-8l^-7p$2hk31>T6-_Siuf+*Q`(2gB#L5^'/gFr9f9bYDso@pBbtK+)H@gUlVa!=h[
1p?EO%HWDQd`qbG'mqP%A3EFGZK^73nm/.Mf":*.s+^IAgip"P<9`pS`V)*7_!J9Kmj"Ag_Q
Yp"h2-B0Zs!/u%Ak<nkASK<G8B8[[]A@I$fh(sR^;*7b$l)Fsk4rPIF\nE'j;)1l@#b]A]A3Cnl
qGE)+@D#3EZ1"M]At\2Ra+]ABWKK`cMNN+7YS+AoJI!JO8$=K-God@u*C%:Z%X\eZf17c<IMnF
PU5"X4+JIWc)1ZT)H#<U>0@_I9^72XOa#NlKe[,W:2P%n7"d:GlKdQY)TW3'@P>K4$odhHcX
aXs23FCSH\u.(PI,YX0DsmWi[I3?!\M]AUCs/]AumWMVBZa!ZbU'7JZ4.:'TRPQ@Mo6*/#+(,#
_"%`;j)ODAk!QGD259X$n89U&+0?`]AY<-&i/X\2t-.rJBo[NYZN7)Fhb8fu`&Z"+g87(T%]Aq
:YP?`C`pbBCnrTe4q;j[GVn>88:IpX%[[_IK1V$Bek5FV=TuW0$9g30FG\"W-#V`el:4E3a0
ed'&Jkl:7TBleN"X>'"e>$h2@anV-?s`f7$OQLQ=k_^icc@FV(dj.Y5.m69d1)VjjmQ9cc[6
;!?pB@3i]AHD"]A(:,6QP=sfBoX$c/;8!N7rU3-bh\`]A(eFmBH+?=6,6Kbb#RAp/+unijpG-p/
sQYF""db:@F5s?3_<D%nd2MDGTM,l0O6DtjV'ZS"<-@i\2%lhK5%SMJoGtX?3K]AEQ_.XU[Y6
u&")I:I#R6uEm+E7$B(`'S?!Jj\/A.oO-qN)@LL`ojo?\JB_@If1_bLR+dlV$XG3fIl=6/&+
P'tY!*[em[EMO#/"p$2Z[BeR@*5JB13KNBuXr>iN?3f+j4n23A_q]AfZ^AJ<\qiCu%^3CRdh!
5MV1MFQaWZmkrK3!?%@JAfEML1f6Ef=`OGke.2MQjs?'0?8q1Aa'PHAD7iH913.EfM3I(E>H
(\D=`o1S2&%d3:>*>4RsG%Dt,%o*e/1eli5D=+LGiS-XT4l\AV;Ul;'nGLQ"hWp)&9VVQ%sd
S@6OdI_(>/i_=fn^@6GHuNm::]A1nmJ/h@b.-LsA[nJS-OSV.I1A>GA:#ej8@[Ob2OH:1]AMPq
NdNMirmmDh,MogsG/+p8,,8_qXkE2?Bk$,J:Qm'V^,,%`AchY'm3P`'Ls'BLf`:CWifP"lOp
S[(]A1P2OBI":l1_Ji4TnFNSlp(d1/%_0RdTe@I<`J3";7FT+C".(B9dKj]AX)O@\3pS!C!dSV
I#NUp%D^?5`,X6`:d(-W>5=ED<>P:WM%*$5-C4kCV*9m>)Wa%1\PJ[4f[q@gFNF4e!P>6X`6
&b_?Q*T[YO/,CK;Y%Cbr#]A(?7u.SI"B$4-8?^t$?B=Z%GA.B\6M+-I*YF:i7%H+Y>?UnfkS\
6W>f!d/M[0:ZCX+q759[KFE@!gJ\kA(K(kb_$T4El$aGlU3>0caldD&g;HrUR'aT=9hm[eeg
CHNPKV`a.o$?<0a3M\b;RKkRAYNbD.l<8-69qih0ufWtBWQcA67Fg3pcFLa1Fdq8mBe1XG2:
msk@OqZ`K7gs]A^M8n?Re+F(*d;Vpt8*Z;d9DI]A/Pa[js`3Ldd$&jg(77ee<FDDhueSo(0Z8;
+/X]AXNs%dt9Ve5u$>E#\#e2i:W=%/qidVmE'OVS$KBBgX(oWA#$br'@X:-'4bR>dI3mU"pc2
O-09^N#N^5%`G6XIA5Ur,jGb9sAs*M!H0b)`;"Ta8,nAZG$+>fLWn3cc3[Wr:(W!16+CV<&*
f6PZQj9WY0L4K>RNZR)22J&!g!rhIiCsbIK@kK:]AE\'O6#n&,1m^`8/Y7_?E9]A!N*7?lEZSC
[O@#gOTc@aS!4]AZ$3c7n7.T4ae=4p@Hu]A!!&)7/Z,r%G*s_lHu:N68kdqkCZ(3`7!:WhRr$U
+;oY/eB1I^p,W'$"E$BTV#!sUOC&9ME:gDUoN?9Io&M0GGm:qN03<At2Hh%+>M`7PPVM\uY=
*K'*E:!#@9ea[c_7"#?:PQaO6JcUV7[l.:14q["!LuCP.mT)IQj,%NmakLj%([6U#+b,'N\9
iKN>SM,\P/IWM\@AM:&YdhiHr\j+K_UdQ"2lR:goXna91I/G1/"AP[Vr\$;jU1cuk]Ac,.?Df
BkYVPas"(BrEl(#o:Pl"Dc>,j7+!:A9qk=Jr=+tXJKqs+34P=RZSG&/(1o]Ab1E/aB0UEL6fd
h'/?[dln'dBY!WPUdQ*di9`V]A]A3*r~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="250" height="150"/>
</Widget>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[723900,723900,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList/>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList/>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="652" y="213" width="203" height="156"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="label0_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[驾驶舱]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="黑体" style="1" size="112" foreground="-1" isShadow="true"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="266" y="0" width="335" height="38"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="report4_c_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report4_c_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="宋体" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="2">
<FRImage fm="png">
<IM>
<![CDATA[m<IeQ*74C;Om"ZY&knAuU:2OZe<$WH.+)h[M)&8AM'+'I7'ro?LT&US&V?sVNR!4)b96YK0l
QKns2=fnpYkI]Af!EZUHgQ7,HM6%<HQrW03bhE)&eYhgB0)L$,UB2Ps7VG:jSs%<kT<D0P'b?
t1tBCX3W$?d7c9]AC"+A46b_^aC:FT8Ng<M-[3K$."4mtCh"IA.V)ANEJ;cCsol,as(#iGOYn
:R3RS%BT25rl%PrJY>YSAMJ;]APOXS<uiGA4/O#5kH?pu7e`CMQTMKCY_d8C$O,a_*HUiqc]A$
u,FaKdEo.N]A_;Gfi[qMaf.:F>UphK'd*5J2t%3dLts3tA>djF//`BY=Y;rK\c\&XWr,GI9DL
[,3*05UlChKmu!J4;6jr]A21H0^".mQ(*#JH$c(;oK09mS98k+QM&)/\Us]A%D4'oRp:I7:Zot
[Wp/T[#9_e_(%e>T]AelQf-Y"27QLj5N8[j-,Y6i6LA/Y#Y>DGb!fpZfXo(N\lcoRP+&rgF)d
>h44->n%8Km/1uS[_Wb5i`KK4f,k_jr*RB'MEVQADL]A"eEjasdk.luk,#laHAn[KWM?]A%j.[
//M&@"GnEOa85C)?P-Xj7OrcO?`1Af?%Ys.4gp8l?3up83b$BA?+B?a+%"&d!Qafm_5l,f;7
/EE$-)jj;AB?a/"(V0.>>>Y6:h3*4Yg[#hO&qcAcX^o#&,dg^E7CI$?IW`iQ<0de='T?0CSS
/nHc>mr$:k@_PDp2d9J1i"(*0f:>uj,#kG'YP=\[OuK8&^U(s?l.B+]Ai4'+kO[l(1:J)]A\28
Fa;_"Z7*N#9S:hr\j7;774*Q&f.lV:jJh2rZCf<L7o/.p'^@XGU)]A_QqD4+65H*0,R$Y-ao6
.b]Al5meHNp#@Qh\E$mKV0^6.9^6r4625@lXi/T!3;eLL2Q\K(d/JA18Himnpla'4$PMYnK@e
CqA/;_1[#NY5-:B$aD_8uN3U8s[R:MeYnQc)QbnG@/$joY&@Ko!MIjRo5>iXq>.`%j-#'J+l
`=^+*PD>p\Z[O&PO)83,3Was/WZ'^38P\tElu!=L:4m)8/=GGU@LQ<AEXTj9F,A>Q9WfbfY3
d6j2kJ8\GPlN:>hhCADnhD>P+9:-OV\0'RXOU;'=5rqsnB=0SQ`O4IK`RQ"H$#bgYU$Lc*7&
7UOGu/_<'Fa*d)priJai)BW-I<7&gt3^DTaaXV%Acq$eX[k%f=dEu0G.QlI[S>el]AbH/l]Ad7
FoQJ(t_VuH+=Na#)]Ap5:6Y_t-;WGgT3@77JX/u_PJ0:T+I%e=CmhY*K2kj%mCk@Z-N9rI?iU
i)`dQe'k/!ot:J*toG9?KNbc*WWLG]A:urq-Bc"E^F+<=89m$tPc!'&lO2Gb$Dr;/0B'1e/bo
f2aJ;j^^eA8+KR-F&<fqX'!pX,#=5SUu0hT.aUuE0AKf./O9_H]A,!l,bp+[OTQ>NLdY]A(UtB
hjK/WB?*2O9oTq/4R?OH?ofL^$f8E;-h:Gp,@(?^K+AW]AJ&T<oGt?*&p"923V/$RU+;;qD-e
R'-7l62d+k1Jb^./=_+SMfL*:Qgb?gqi?/ha7\rn84g`rc#[+N+cXD^=m%D1%++@Jp!Yh$4k
-+2Zio<!V=X3AP08[TeQTN#`8a37&mK95X2^n&1GX[7r2l("1[p5N\NI6kZN&OOs?O`EkJoq
=]Ao,[J]AltS(a9Wa;W_84%_GU%_0l7=Gg(d?/`#Iq!5tu5P@cHG9>MLRE?&u(B?44\MYFuf4V
r.@@f%A^b6b`S5o5TU&(_'"'PXep6!PG3^*FIq9l#oq$(<6a&(cX`t0Hjh#1]AOcMMkI0k!K'
]A08A"m?e?@M!mGG>+!I4%Ot8`6h?<jLX43&0q(Mo\Nk!sZ[fqO:+90K>"4&]A>?@:t3]AX1MlC
C>gn&MpTU9c6<]A-T+^_g#,\G4C[ERb`ZbN+SH%QslBV,/kb\I,H?Ig,n-5HR3-$jbi@H9EVT
FPMH2H58of>!8^:Z*D5CA^DR?g:'LmV*ocilO/"XJOE^:Q%`jmR0pfYJnXJl9fe6ErXf]Ai?.
MVS;[F;<eO`a;),?$l2]A=,C,[UtWclW6$8=pb"/!F(#Qn_qI?=7QY]AGTWkfPXZa$r=.PYQr,
2Hf&,(F,N'u557YK('!-=0!QR#!LU[;F;$*<=8`3p:7C'&b4WO?MPHrY1%&4LT&:aQTqQMRO
FCp88)%iGJ$RR>M.1X<lKPl4//r72VF$KsDbP\==(aRuE-1.H%M=_j?D"L1\nA:\S,@Zhh7X
JcscE)/lMU9Bgr#?mk7SZO/:3<&2>Y939=jODk4uUZm8B>6W=3,8+1FKr1A5YM+;]A_9C2^!Q
J`/!6rZ[1&<h(l#7AY<%jSIFLr8^j/ulXDmmD^p(sH_'G^*s)ZNH*RCW7Mi.nbN)p,FYVZ&b
@LZ9,<;U['oUfSJ#gK[1gHSD3G23!T(cH@OhBr=AB.;\Kp#llU6sSLRW$MT/CO#&?gWlV#FC
GL5WD.nX*oLKf@G+7q8J"#m'[P?YKu1&gK3pGYIfhjL/XbgHY:Ng/2\1pp5qNY'slqi4ZU$;
44(`56pcGJi=N[c^FQh("EuOb(Mk%J]At(ZqhYhdqU<AsGcFc<3ZO6;Fn+.g5_(bYK8rDY$_(
88?,BQANT_%pBGQ:fZ8iQWIJdj$D:Po`@-"ZqqNDTP#+?j"ns3UOHKj0^i:i%1$D\ofD'A;a
r0>q^mmn796+/)]As]A&L+a[ddtc1FS'Bj@pKq?\q:B[/FpKFRd<r?4rD`SqeXIO)NI0OF//o,
pR]AqGX=Tao&qfC/loqM.$fN3394D>TCP8"EA,e[J^,?FpE#WlPiV>0lWoeV4J7ao;1aIS<q/
EJ+o-W$OT*jiC)71J!W2o5rs/T("XhePlm!aM.bfN<?Z4^nT_0;X?o+jLl+kD2S=#m1r&Q7%
nl"K=Z?L-p!sU)>es'kf=V1C@4)2PkjLV;0n#7_?>NY&#hce-qN+5cg#=.rs+KQZpF#cN?"u
O4e,msr^Xhb]A%3/NIgD0]A_o\CL%Q15lkD(Zs+`.Or[4c(t[L=8+R;CuMW:HQSO;,0r2ACg0[
8rZM+b(D,ik_e%$FI^Q`-rT'?1H#,giY8WG%R_(YlS;14Z&>5h;Jc\/)lpct_UB7NLP=)4lU
lethLR!(,GG,r)b-JTRkhP6h;r;#[A+"aXmCVM-+s>G^Aq9Z^^ntj2dZ3ptg8K3;*K&3UmAn
'1\9^Bj\,76*>Y%:3gq`%c"ad(+,hu4G#=F2'KV6TU+euK:TslINKNuD64TFRAVET5V>D:1W
5n-Jn8dMd;0&KX(#K_L6Gp!O[Cp*lnYAp<,LY\LhGOKZiJI7sPDalJ%\/b#G^]A+#j!MRe_Ml
5Y-^bGod*\`0?4pcCu^:+P7j#OO?`.e[O+_*]A!OX=YJa)WX;*j\K]A&$_c?8lCt7AVYS(rtPm
Q"H_1f?Yrt_>cU/_LL$sZ#BZV=$+lmQ1Y5Db?k.G!#e[M^`t-eg_7@aK8oKupb,d?5qs!p)n
_o8rY7UbrI$DmHl7]A8Gbrn65\dU6jWB?Z\D`_t5=npr)`=B1e3M.$$]A.9J'[__$K-n"/cUXd
>sG@&TI+c#EF_%aeI6SV(9Ro?)-*TOnR@Yr((537D/GBAa>_cP2n2F/)VIfZD4)fg#=7hl*s
?Ag>N7MB$-7+,ogXa2-#7!kab!`(U+3CG.o(7Y@\o>,l;J*nUWp9/]A6/g8:&&&G_g%B^S]A+N
uSo"PH6ro-JLnb;d5*e1,:`WM^[HU\6S:D+Db>pa_,Jqu0?gWHJ":'X4-8mL^J5o))ko)M.\
Lb!9K4(?hnhF7g0QV<2@GQT$E,]A9bQA>f9f$!)AbBs)b8H&"N0k8XW&%%!0]AJ?rJ0NaXhMj$
:?BgB+A0Y.;0/C=p=*4/mZ\0HWO>^H,S6o$5QFRQ\!QA5:e(]A=V)gJ1SQtL_7o:B6:)9XFp8
/Zl(9uV8R.TBi?Kfm<ALms#tJ7IfQ//#&_c&"<,UH\b.C-1gZ[A)jKOSVU_?u!8AFCuTBTh'
/0T;ZV]ABW]AbE,!eM2PNK*^Hg8pB"mQSEng%/;QH[1lBqnW2E:pT5E?QcA&)=cLs/[W]A1aL<g
DQtA2WrAZY>SO8Q#WJ5d2Hl'8.O-K+uA@NQ<bV$:QL5(n`>b`9k1PWr[$TkI.Ii%%ZV-9)TQ
d5Z6j8dkc9De:KBCHS1pfpMIKpDE#m_FYM?2e(6ga"QmE/Pq@(pfNB;Zgnj:SV42V'q&qYJL
Ve')-LEZ.<4^3lm:=)lm@:=2;O/@U`bd'BJr9@,6,&Vo<oXCm8pMh\^1`#RfJ';p>#nhf`lk
\*-1Aru]A%q4#+j[Y8[7Bd*EBCW7j:j!VD;4E#liFn)6Hg#q(#u<C4H2-)Dr-:b$E\$U;FklW
Th$#F"W7#4,>rd`O^)HYellFFf!<4ID?Bd2DQWd\8pu+RXYO)TeTnLWK*pT;q$[;$'bNd9%R
P^4^kDWS?\7>6QQ'2n*EU>X?'!,ZhRaEPY4Ke=ooiErqG_[:BVK+qgq0d4)#GJj?0"%6=+V@
i8AgI#lRYhC1H2He=YSB+T8)6#Zt=$>IaK)/8'uIMQ3kMickJPh%LQ]A*l2[@5U6b0F`?OkRC
O_7H<lHP:c$"W1B`IV@7r!3qB\=2a\m)ZuSu^>(>ADifYk!M*VUaHd`a@6CE'p_['U)WLHu/
D8[2.huZt+fIk'`MsHQej]A>Ri*VZgnd,K^du0"To,*T*QtG#L&goF.Yj.LZW28qc]A#dG]A&`=
a?<9N1hcA6l=D-R'VWMWDJGP_BUKbY8c&,GShp-TqE'utB7R^GN4sL8o3kr999`)J6HCb2<,
sfocpjl/Btfp>$m!/N-HU-^T5;Z#EWtUN6B_Cr]A?8bN1+Gua&TRUr2"lGp+B]AI\[(XM&<LiO
6Hn/V-:T1=]A5=XrbcN6"hmFmnk8;+dmTq0.qkQn]A<r^CAi;9oCr(U:djA6En3-.^Z3KMAiqH
#iQ>-YtcW[Sbh9c(_G[r$f1M'k;NhX=?3KKZlYYI=7]Aa61M"J?b^5kJ,;Tu%>Ua<XUnULS2R
Hm@I6atJ(""-!hbSkh06Z*cF*fQ]A1T9A8J&!'o"'nsKD%O\c_"#5kl.n'A9,^b6^?%`l4IA^
39E&n^(\pT;4/_T>N17uZ"X8DGKLF4F=Is!Ma,,t[86MQ;X2R+a0XVj<I4]A2,$S1:("p@GgL
&tg"#g_8<.#E9h7^>AIR0/`:[GPK%Km6+k&.@]AnnT3nGk[+>D_2[Fa2h8a2V#\4;(*'*c[f1
bYmQfTJ<u)%eX()!4[/[M(Gdr98c&A>9,8H>WJ-Suo]A\gYBX2$%#lW2c,j[/F>E()*Pu(/BQ
.SCmBHZ0@<f3\DVb9f'g>i$W^Vg1V_osZ^,ROZ<gc>3[=(Keg#s,![GH4"c(Wtmfr?3&>pQ"
NTD4Xj/AuX0h2VO[4PZh6KLQn6o"cLdnA`A2'IV@V\9F\7%oB@eJrRV'Z=!`2G*:Q+/Gb1/H
eC)"<+.a*WdSY36-BV^AS#2mna>LQ?J^b.MA%F7LKhj`/W=EB00H=Hlhq&"p_jjpbjfQ4`qu
!76i_6SE4JDEE0hQ,jaXHt+cSdSK]A8>Go3j2>qgT'8Ff^(BQq#2Bpo0'Up'$6;\MM?;Q+3B'
\."Ff!qBK=598m0fC:73r"a98J@mW=L$FcmZNa\>_]A`'_[*cUH#9KVmM2T*<$qieHM@rq;$:
GQV?Pu.__r@?jnk2FRr\F%$lpfjUO0tI<unX8&K2(5TK-)[TRfrpjlFS!^Gbb1#iC;=:^h9j
g?kI:I&bY>d3N2VjijM\Dko_#j!)?d*h"6ssuQ-R7c'U(Y'5lhL'nI'fud2\5ugJ'(tA=;=<
Ttc9M>W-KSd`p,^Jn-UCm(s!rM2EfhZ,qIfkGNTgH)HaX%PR5b*Z`kP[N,pjF-:-^jeHI;kF
ITT\+j4C2J''&X?oht-Og+(K-+tRHZ;W9CnaoMe'/S!T"-j]A5Ad=EmTIReAXn'obbu0QB]A=d
::c%bMO#<l_[`LG,_(@22c@7uWV,$W"/t="?F^:Bum"+J,f<fs&&VT<Nn5VaiE_mo3<p1&'%
2&Mi\0"G*0lhG<c#%>0oP3@ar6*938G79<,g^@e7<`sq[]AJ0f2:p=\PO8$IpKX:rp4*^G=(p
bDPZ:3ZQ'IX$e%F=5OumMaORo$OnXUDFLS*-VGTSE0g/9CjcVS`Ve'1l1MS10p>]AXepciqLn
F(<"p>Xp[:[-oCWXtkLJEb9G/Cir2&O;WEK,'s[mI9nmh,Y5SM>A?j.&@$SfF,P^)";`@q)N
=3DHp^M85P?2".Z(c/CL^/-=Q7%\nn7j_@mXG+[!hbJ55Tgc>VP'!Ia8,GFljK'jH(aj2DFj
d0b'NubTRnmZ;qN<,<JANm\H$i+-#J/b!Uld_fG>2%c<.hj:'k=p$=Y-Ccfn3[C9pnfh89Tk
lATsUS<Ub_K,Yo69T$07cEBYS\JNZfOJWG)K/Sfi+=(@D4\DoH/33O)Ie'UEI"!BTeN]Aq'`2
\K*NTr+.-'26I($er!HKa%ME/tM;4@k2;t`ZLb^/:[[%S?!6usf3DS5mZjcj;W:5#_af@fBL
Hpl:EYI\B='p76OdU-?c`j>X/S8%b3f:77;)+LCD]ASeWi7F96q0tf/.$NIcQEDEr!+nb*B6/
/oVP9K(ApJ^kRGa'BU>`GGgFN(khI\ce=K+N.GD7Ou*@^'PN/@VNnn/n&B8+&2WbG,`<If,8
)D5RECkOmFd`ASIIal#uJf3LHApid\0)BmK2ZH[GE3Hk5*#2$0^l+ARTpn8d!X.h2,3"Pi49
o-O#FT.+n\;L.uNof[hQ0`C&OY!S<Q))7#D3,nS9+>),FP^'#ZY#0P<hVNfV9ES`"+*VNMDE
Ljr'\Nq\0fiU>p>pZ<b*%:m%Gud>E%)W/AWU#YYTiPW@sKc7oM?fW]ABRrhtDI3B1CKYnV/4D
^t#0&KIHYIL0@gE:[DKd2Cr9!;lSYaN,1;98%k-,R/)hSfOgA"fKlisOkj4*,@31%2_Kj3kU
p7m,j)[G6X6NLp1b)mG-IO&$<K(i\-8u5@5D?N-Mh#^JE'mKhD:(ulVV;CN=:\YiinE9)K;%
Z2?Fm1>$'jg^XDZIeu`<;]A&;pY!$E?)A4L5:2*4;,=5XEP[,jI:-MZ<j+CkOcgCI=H=&k>VK
YMQCUg7mWb\H&4)g'1T')So?;UY2H/0E]A2`]AEJ3.rd);E&VT+XWKP25]A9VEB8t-k+EgggQW&
&"c\k<@8MXV1/VQ^;9-%iOe2@>i`5sW]A:lc!B"OZ'K88uNo[p>-o$2(;/PAS*h4dDL?NGNK7
Xj<aViJ>sT<Upm[U_@[gDA!;F^QPN=e<*O.@ABG^mr:LbC0^38``N/<2==p]Ap:TIreL0cjjG
D53TO=j#%.\jO_\(WJl7-_Z`V]A;m#tgfZ>M-Uj4-U<`hF/9eTCqjHWEt]A'0_@t\0d#_lI<MC
p7E7;=R7Pa,iH5Uqi\sTZ>.?\2iG;l59KF.J,2q7qEDl;>@@q0KI43rt9aA>Lj_k*0Nc/51^
L.Qc;5)&QZK_,,kaVB*ds#+@)FPGIr1=2'-pBW(5&r\%il[,Vc=e*n`1dfI.`fNRo*FiZ=^X
[l$d(P)PK/`JV_?=cn(?9oYbDbk/=uJ==!.D1*"DcAW'io4c/C"(p>/B,Jk"Du#-M`Eg=V)J
@VN<b;00A3BNcIG:u!SSo=N]Aj8;g`L_fgRTib[\8%7Fft(%?Rb'&P7nl1#,pao-$kSN?N%L3
q/4?O#E\)*5F,2(=r\^Mrp'r^lMeNu!Xe!scc(CE(>X[!e#ocA==5rY)ANnD*\caX:DpcX8q
no^pZ'*KL/6^(]A8[/p'[_WR&[HnKk[-B0#lj&VI`1e%I!@N0S:qP`uR[3pT!IqHY'u1cJ[%k
%0'h0(hA$2T>;&Y#spSQg<t6S7_=TE^&!8/.Lm`S/&8#,IMf*k',0gPsn6Ini,3f'.,?uCNd
k?4Y14orO]A+mWU;m_X]A'Q)Im9UWJ^%ea?0dNpe'o653_`s/0%7Qn:J=.:,)+jF(CuOlNNJ8W
r@d>Eg:f#s$:@8j(i4Yf#`Gg9>hI=L>W0pJ=kV(G9f&`W2)=AC9\JDkU0m/%`3^9a[kojp[e
V_6"uJ)gi?+(c^qEoX$9$qa#3N?/"nX\`?%g2G-%iD8`ifUL?MIPk_csq4i50Ha&Jr.R9<#@
SbBm9@eX<-sfLN2iUZgunO(,;Y%5YkQhPetkTRA!V/Wpu\Y6H)q+P.UkD^RRC=0hbia#:rO(
u1P%qG$aEpJ)%inQIWo)*;6B[qcSX-jPZ3HprG)GLeVbm7T:FG`H0F4@\g#SVKGq>DK1tr^@
Nk-tJZ_jll/D/gg!smNk?'\<8T.%bseGaI>oia@dAXf#A2'k[O4d[%@]ATnFr_R=7Aoac!pn`
b\!q_3,<Cbb9HeYc26e,.`YMoiB,777(D`7haZT%Y8W++,$<go<r09bbX"iC'a`40K!R=obN
qXG`]A/N`ccQ'aq/=XA;b9jQ(tY?IkZ6IpRJ:T3DWb?=qhcL[4b"CBq*A1IeZ[;E<kA,%c?P^
LRqG3*gdhn,PHHc50g#cDmeT!V</LN`lMCDLF,s60YoVP8^C%87G@RX&?BeKnUm>-umgER6Z
p6.RS&E,>%K#42`UH3us3f..!OuMq1-/e&,;`W)8X2+ob0ik7.5gR2`%6#1m`H&o_fP>O&ln
_@8cWrTr.TA4\s']A2$f0Df\Rj`5pl$ZF(t>,L:AIs9]AKp%5k-hfS`^_2snqGdjY%g/bMTU^L
4f2WBG`VH!?'4_J8s0-eSVLZcl'KdF+eK"(,BAOt<@btP<P2fqjuG@Nm#_s+q*"?!EbZiOG+
YeGj$6P-qM1n$>9e5pcMG&i;V))FAFS-U_!'NKaDLPG=c(&2cF$s[er/jX9MMfhg@E\a!+)W
M/ck4Zb.*+^kBmE)>EO?6`Fe@.E)W)l$^7:ZJZ3rc@6"6mRPcL>;]AVSLX9oPG2S>Zja04*Ao
imjDpp[PpK!RLo4tTk\Hf!hiQ2lj78)Gh2*D@jJoDEEI/_:5dm2nVs8"0Eh>j2QI$)Rr[&f!
hKF?;OlI!bsURBl6o4>#-ej>S\XV7;0#Z/)mW#+.5!r1Z>ZNE_'=37<;DE.;:FV3d3^I%U:p
=&[/%Osur-o:<\A:LAMpSUGr4;<s9CBOD`"H3H((;([`bX8cC6$V'Jk)WVm_L&#dihu\]A/HT
7$G&OG4<X8-(%N4C\,,#%3Ea*,XpqDlo>BHJr]Ak\[bc>(!*gNPF=:O"&+9[VQ30QE;4L's&V
mGoC3r&)#u(6[c-I(aHEQPPl^9-@-8O/)j2@"V9[qp+Ka;9H5W]AT>u1o>-+AF`TL^KJO`#UM
eqL5k<d>JKdDW>2Uhc(]AA.,t)`If<anR!0J0]A2"BEeX_#9>+?9G8V]AF(XcC_fB)[a.2iaTR8
0BX[U>9E]AL;idU'4o(]A14QqrtM&S7[cEg,@7^[i[?50k686ZE@jcHG>=;09*Hh@dC4EP8aQU
YNA4AF77hZBA_fjkW(N8I#:41ieBP#[UukI[A;UG0#o==lsGGf[U*o*2NGm#2'+1gFrVtRFZ
eunA0ua3]A\=U=AB_E;Knf>UDq\cXfO]AUM+.4sl7Blc3lA'P*81AXUr^;Z#"lp`+.eGu92]A7`
1#F3<l_:S2r#euhk(Xcga#]AS]A4@0PE8Q@jbOGAZR]A48>c$rI9o6Yd72KbjE]A#cl^j5=0J3t=
t54Sn&>tXJpWI*&M:0[s8?.nSnT'U<iauirI4~
]]></IM>
</FRImage>
</Background>
<Alpha alpha="1.0"/>
</Border>
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="2">
<FRImage fm="png">
<IM>
<![CDATA[m<IeQ*74C;Om"ZY&knAuU:2OZe<$WH.+)h[M)&8AM'+'I7'ro?LT&US&V?sVNR!4)b96YK0l
QKns2=fnpYkI]Af!EZUHgQ7,HM6%<HQrW03bhE)&eYhgB0)L$,UB2Ps7VG:jSs%<kT<D0P'b?
t1tBCX3W$?d7c9]AC"+A46b_^aC:FT8Ng<M-[3K$."4mtCh"IA.V)ANEJ;cCsol,as(#iGOYn
:R3RS%BT25rl%PrJY>YSAMJ;]APOXS<uiGA4/O#5kH?pu7e`CMQTMKCY_d8C$O,a_*HUiqc]A$
u,FaKdEo.N]A_;Gfi[qMaf.:F>UphK'd*5J2t%3dLts3tA>djF//`BY=Y;rK\c\&XWr,GI9DL
[,3*05UlChKmu!J4;6jr]A21H0^".mQ(*#JH$c(;oK09mS98k+QM&)/\Us]A%D4'oRp:I7:Zot
[Wp/T[#9_e_(%e>T]AelQf-Y"27QLj5N8[j-,Y6i6LA/Y#Y>DGb!fpZfXo(N\lcoRP+&rgF)d
>h44->n%8Km/1uS[_Wb5i`KK4f,k_jr*RB'MEVQADL]A"eEjasdk.luk,#laHAn[KWM?]A%j.[
//M&@"GnEOa85C)?P-Xj7OrcO?`1Af?%Ys.4gp8l?3up83b$BA?+B?a+%"&d!Qafm_5l,f;7
/EE$-)jj;AB?a/"(V0.>>>Y6:h3*4Yg[#hO&qcAcX^o#&,dg^E7CI$?IW`iQ<0de='T?0CSS
/nHc>mr$:k@_PDp2d9J1i"(*0f:>uj,#kG'YP=\[OuK8&^U(s?l.B+]Ai4'+kO[l(1:J)]A\28
Fa;_"Z7*N#9S:hr\j7;774*Q&f.lV:jJh2rZCf<L7o/.p'^@XGU)]A_QqD4+65H*0,R$Y-ao6
.b]Al5meHNp#@Qh\E$mKV0^6.9^6r4625@lXi/T!3;eLL2Q\K(d/JA18Himnpla'4$PMYnK@e
CqA/;_1[#NY5-:B$aD_8uN3U8s[R:MeYnQc)QbnG@/$joY&@Ko!MIjRo5>iXq>.`%j-#'J+l
`=^+*PD>p\Z[O&PO)83,3Was/WZ'^38P\tElu!=L:4m)8/=GGU@LQ<AEXTj9F,A>Q9WfbfY3
d6j2kJ8\GPlN:>hhCADnhD>P+9:-OV\0'RXOU;'=5rqsnB=0SQ`O4IK`RQ"H$#bgYU$Lc*7&
7UOGu/_<'Fa*d)priJai)BW-I<7&gt3^DTaaXV%Acq$eX[k%f=dEu0G.QlI[S>el]AbH/l]Ad7
FoQJ(t_VuH+=Na#)]Ap5:6Y_t-;WGgT3@77JX/u_PJ0:T+I%e=CmhY*K2kj%mCk@Z-N9rI?iU
i)`dQe'k/!ot:J*toG9?KNbc*WWLG]A:urq-Bc"E^F+<=89m$tPc!'&lO2Gb$Dr;/0B'1e/bo
f2aJ;j^^eA8+KR-F&<fqX'!pX,#=5SUu0hT.aUuE0AKf./O9_H]A,!l,bp+[OTQ>NLdY]A(UtB
hjK/WB?*2O9oTq/4R?OH?ofL^$f8E;-h:Gp,@(?^K+AW]AJ&T<oGt?*&p"923V/$RU+;;qD-e
R'-7l62d+k1Jb^./=_+SMfL*:Qgb?gqi?/ha7\rn84g`rc#[+N+cXD^=m%D1%++@Jp!Yh$4k
-+2Zio<!V=X3AP08[TeQTN#`8a37&mK95X2^n&1GX[7r2l("1[p5N\NI6kZN&OOs?O`EkJoq
=]Ao,[J]AltS(a9Wa;W_84%_GU%_0l7=Gg(d?/`#Iq!5tu5P@cHG9>MLRE?&u(B?44\MYFuf4V
r.@@f%A^b6b`S5o5TU&(_'"'PXep6!PG3^*FIq9l#oq$(<6a&(cX`t0Hjh#1]AOcMMkI0k!K'
]A08A"m?e?@M!mGG>+!I4%Ot8`6h?<jLX43&0q(Mo\Nk!sZ[fqO:+90K>"4&]A>?@:t3]AX1MlC
C>gn&MpTU9c6<]A-T+^_g#,\G4C[ERb`ZbN+SH%QslBV,/kb\I,H?Ig,n-5HR3-$jbi@H9EVT
FPMH2H58of>!8^:Z*D5CA^DR?g:'LmV*ocilO/"XJOE^:Q%`jmR0pfYJnXJl9fe6ErXf]Ai?.
MVS;[F;<eO`a;),?$l2]A=,C,[UtWclW6$8=pb"/!F(#Qn_qI?=7QY]AGTWkfPXZa$r=.PYQr,
2Hf&,(F,N'u557YK('!-=0!QR#!LU[;F;$*<=8`3p:7C'&b4WO?MPHrY1%&4LT&:aQTqQMRO
FCp88)%iGJ$RR>M.1X<lKPl4//r72VF$KsDbP\==(aRuE-1.H%M=_j?D"L1\nA:\S,@Zhh7X
JcscE)/lMU9Bgr#?mk7SZO/:3<&2>Y939=jODk4uUZm8B>6W=3,8+1FKr1A5YM+;]A_9C2^!Q
J`/!6rZ[1&<h(l#7AY<%jSIFLr8^j/ulXDmmD^p(sH_'G^*s)ZNH*RCW7Mi.nbN)p,FYVZ&b
@LZ9,<;U['oUfSJ#gK[1gHSD3G23!T(cH@OhBr=AB.;\Kp#llU6sSLRW$MT/CO#&?gWlV#FC
GL5WD.nX*oLKf@G+7q8J"#m'[P?YKu1&gK3pGYIfhjL/XbgHY:Ng/2\1pp5qNY'slqi4ZU$;
44(`56pcGJi=N[c^FQh("EuOb(Mk%J]At(ZqhYhdqU<AsGcFc<3ZO6;Fn+.g5_(bYK8rDY$_(
88?,BQANT_%pBGQ:fZ8iQWIJdj$D:Po`@-"ZqqNDTP#+?j"ns3UOHKj0^i:i%1$D\ofD'A;a
r0>q^mmn796+/)]As]A&L+a[ddtc1FS'Bj@pKq?\q:B[/FpKFRd<r?4rD`SqeXIO)NI0OF//o,
pR]AqGX=Tao&qfC/loqM.$fN3394D>TCP8"EA,e[J^,?FpE#WlPiV>0lWoeV4J7ao;1aIS<q/
EJ+o-W$OT*jiC)71J!W2o5rs/T("XhePlm!aM.bfN<?Z4^nT_0;X?o+jLl+kD2S=#m1r&Q7%
nl"K=Z?L-p!sU)>es'kf=V1C@4)2PkjLV;0n#7_?>NY&#hce-qN+5cg#=.rs+KQZpF#cN?"u
O4e,msr^Xhb]A%3/NIgD0]A_o\CL%Q15lkD(Zs+`.Or[4c(t[L=8+R;CuMW:HQSO;,0r2ACg0[
8rZM+b(D,ik_e%$FI^Q`-rT'?1H#,giY8WG%R_(YlS;14Z&>5h;Jc\/)lpct_UB7NLP=)4lU
lethLR!(,GG,r)b-JTRkhP6h;r;#[A+"aXmCVM-+s>G^Aq9Z^^ntj2dZ3ptg8K3;*K&3UmAn
'1\9^Bj\,76*>Y%:3gq`%c"ad(+,hu4G#=F2'KV6TU+euK:TslINKNuD64TFRAVET5V>D:1W
5n-Jn8dMd;0&KX(#K_L6Gp!O[Cp*lnYAp<,LY\LhGOKZiJI7sPDalJ%\/b#G^]A+#j!MRe_Ml
5Y-^bGod*\`0?4pcCu^:+P7j#OO?`.e[O+_*]A!OX=YJa)WX;*j\K]A&$_c?8lCt7AVYS(rtPm
Q"H_1f?Yrt_>cU/_LL$sZ#BZV=$+lmQ1Y5Db?k.G!#e[M^`t-eg_7@aK8oKupb,d?5qs!p)n
_o8rY7UbrI$DmHl7]A8Gbrn65\dU6jWB?Z\D`_t5=npr)`=B1e3M.$$]A.9J'[__$K-n"/cUXd
>sG@&TI+c#EF_%aeI6SV(9Ro?)-*TOnR@Yr((537D/GBAa>_cP2n2F/)VIfZD4)fg#=7hl*s
?Ag>N7MB$-7+,ogXa2-#7!kab!`(U+3CG.o(7Y@\o>,l;J*nUWp9/]A6/g8:&&&G_g%B^S]A+N
uSo"PH6ro-JLnb;d5*e1,:`WM^[HU\6S:D+Db>pa_,Jqu0?gWHJ":'X4-8mL^J5o))ko)M.\
Lb!9K4(?hnhF7g0QV<2@GQT$E,]A9bQA>f9f$!)AbBs)b8H&"N0k8XW&%%!0]AJ?rJ0NaXhMj$
:?BgB+A0Y.;0/C=p=*4/mZ\0HWO>^H,S6o$5QFRQ\!QA5:e(]A=V)gJ1SQtL_7o:B6:)9XFp8
/Zl(9uV8R.TBi?Kfm<ALms#tJ7IfQ//#&_c&"<,UH\b.C-1gZ[A)jKOSVU_?u!8AFCuTBTh'
/0T;ZV]ABW]AbE,!eM2PNK*^Hg8pB"mQSEng%/;QH[1lBqnW2E:pT5E?QcA&)=cLs/[W]A1aL<g
DQtA2WrAZY>SO8Q#WJ5d2Hl'8.O-K+uA@NQ<bV$:QL5(n`>b`9k1PWr[$TkI.Ii%%ZV-9)TQ
d5Z6j8dkc9De:KBCHS1pfpMIKpDE#m_FYM?2e(6ga"QmE/Pq@(pfNB;Zgnj:SV42V'q&qYJL
Ve')-LEZ.<4^3lm:=)lm@:=2;O/@U`bd'BJr9@,6,&Vo<oXCm8pMh\^1`#RfJ';p>#nhf`lk
\*-1Aru]A%q4#+j[Y8[7Bd*EBCW7j:j!VD;4E#liFn)6Hg#q(#u<C4H2-)Dr-:b$E\$U;FklW
Th$#F"W7#4,>rd`O^)HYellFFf!<4ID?Bd2DQWd\8pu+RXYO)TeTnLWK*pT;q$[;$'bNd9%R
P^4^kDWS?\7>6QQ'2n*EU>X?'!,ZhRaEPY4Ke=ooiErqG_[:BVK+qgq0d4)#GJj?0"%6=+V@
i8AgI#lRYhC1H2He=YSB+T8)6#Zt=$>IaK)/8'uIMQ3kMickJPh%LQ]A*l2[@5U6b0F`?OkRC
O_7H<lHP:c$"W1B`IV@7r!3qB\=2a\m)ZuSu^>(>ADifYk!M*VUaHd`a@6CE'p_['U)WLHu/
D8[2.huZt+fIk'`MsHQej]A>Ri*VZgnd,K^du0"To,*T*QtG#L&goF.Yj.LZW28qc]A#dG]A&`=
a?<9N1hcA6l=D-R'VWMWDJGP_BUKbY8c&,GShp-TqE'utB7R^GN4sL8o3kr999`)J6HCb2<,
sfocpjl/Btfp>$m!/N-HU-^T5;Z#EWtUN6B_Cr]A?8bN1+Gua&TRUr2"lGp+B]AI\[(XM&<LiO
6Hn/V-:T1=]A5=XrbcN6"hmFmnk8;+dmTq0.qkQn]A<r^CAi;9oCr(U:djA6En3-.^Z3KMAiqH
#iQ>-YtcW[Sbh9c(_G[r$f1M'k;NhX=?3KKZlYYI=7]Aa61M"J?b^5kJ,;Tu%>Ua<XUnULS2R
Hm@I6atJ(""-!hbSkh06Z*cF*fQ]A1T9A8J&!'o"'nsKD%O\c_"#5kl.n'A9,^b6^?%`l4IA^
39E&n^(\pT;4/_T>N17uZ"X8DGKLF4F=Is!Ma,,t[86MQ;X2R+a0XVj<I4]A2,$S1:("p@GgL
&tg"#g_8<.#E9h7^>AIR0/`:[GPK%Km6+k&.@]AnnT3nGk[+>D_2[Fa2h8a2V#\4;(*'*c[f1
bYmQfTJ<u)%eX()!4[/[M(Gdr98c&A>9,8H>WJ-Suo]A\gYBX2$%#lW2c,j[/F>E()*Pu(/BQ
.SCmBHZ0@<f3\DVb9f'g>i$W^Vg1V_osZ^,ROZ<gc>3[=(Keg#s,![GH4"c(Wtmfr?3&>pQ"
NTD4Xj/AuX0h2VO[4PZh6KLQn6o"cLdnA`A2'IV@V\9F\7%oB@eJrRV'Z=!`2G*:Q+/Gb1/H
eC)"<+.a*WdSY36-BV^AS#2mna>LQ?J^b.MA%F7LKhj`/W=EB00H=Hlhq&"p_jjpbjfQ4`qu
!76i_6SE4JDEE0hQ,jaXHt+cSdSK]A8>Go3j2>qgT'8Ff^(BQq#2Bpo0'Up'$6;\MM?;Q+3B'
\."Ff!qBK=598m0fC:73r"a98J@mW=L$FcmZNa\>_]A`'_[*cUH#9KVmM2T*<$qieHM@rq;$:
GQV?Pu.__r@?jnk2FRr\F%$lpfjUO0tI<unX8&K2(5TK-)[TRfrpjlFS!^Gbb1#iC;=:^h9j
g?kI:I&bY>d3N2VjijM\Dko_#j!)?d*h"6ssuQ-R7c'U(Y'5lhL'nI'fud2\5ugJ'(tA=;=<
Ttc9M>W-KSd`p,^Jn-UCm(s!rM2EfhZ,qIfkGNTgH)HaX%PR5b*Z`kP[N,pjF-:-^jeHI;kF
ITT\+j4C2J''&X?oht-Og+(K-+tRHZ;W9CnaoMe'/S!T"-j]A5Ad=EmTIReAXn'obbu0QB]A=d
::c%bMO#<l_[`LG,_(@22c@7uWV,$W"/t="?F^:Bum"+J,f<fs&&VT<Nn5VaiE_mo3<p1&'%
2&Mi\0"G*0lhG<c#%>0oP3@ar6*938G79<,g^@e7<`sq[]AJ0f2:p=\PO8$IpKX:rp4*^G=(p
bDPZ:3ZQ'IX$e%F=5OumMaORo$OnXUDFLS*-VGTSE0g/9CjcVS`Ve'1l1MS10p>]AXepciqLn
F(<"p>Xp[:[-oCWXtkLJEb9G/Cir2&O;WEK,'s[mI9nmh,Y5SM>A?j.&@$SfF,P^)";`@q)N
=3DHp^M85P?2".Z(c/CL^/-=Q7%\nn7j_@mXG+[!hbJ55Tgc>VP'!Ia8,GFljK'jH(aj2DFj
d0b'NubTRnmZ;qN<,<JANm\H$i+-#J/b!Uld_fG>2%c<.hj:'k=p$=Y-Ccfn3[C9pnfh89Tk
lATsUS<Ub_K,Yo69T$07cEBYS\JNZfOJWG)K/Sfi+=(@D4\DoH/33O)Ie'UEI"!BTeN]Aq'`2
\K*NTr+.-'26I($er!HKa%ME/tM;4@k2;t`ZLb^/:[[%S?!6usf3DS5mZjcj;W:5#_af@fBL
Hpl:EYI\B='p76OdU-?c`j>X/S8%b3f:77;)+LCD]ASeWi7F96q0tf/.$NIcQEDEr!+nb*B6/
/oVP9K(ApJ^kRGa'BU>`GGgFN(khI\ce=K+N.GD7Ou*@^'PN/@VNnn/n&B8+&2WbG,`<If,8
)D5RECkOmFd`ASIIal#uJf3LHApid\0)BmK2ZH[GE3Hk5*#2$0^l+ARTpn8d!X.h2,3"Pi49
o-O#FT.+n\;L.uNof[hQ0`C&OY!S<Q))7#D3,nS9+>),FP^'#ZY#0P<hVNfV9ES`"+*VNMDE
Ljr'\Nq\0fiU>p>pZ<b*%:m%Gud>E%)W/AWU#YYTiPW@sKc7oM?fW]ABRrhtDI3B1CKYnV/4D
^t#0&KIHYIL0@gE:[DKd2Cr9!;lSYaN,1;98%k-,R/)hSfOgA"fKlisOkj4*,@31%2_Kj3kU
p7m,j)[G6X6NLp1b)mG-IO&$<K(i\-8u5@5D?N-Mh#^JE'mKhD:(ulVV;CN=:\YiinE9)K;%
Z2?Fm1>$'jg^XDZIeu`<;]A&;pY!$E?)A4L5:2*4;,=5XEP[,jI:-MZ<j+CkOcgCI=H=&k>VK
YMQCUg7mWb\H&4)g'1T')So?;UY2H/0E]A2`]AEJ3.rd);E&VT+XWKP25]A9VEB8t-k+EgggQW&
&"c\k<@8MXV1/VQ^;9-%iOe2@>i`5sW]A:lc!B"OZ'K88uNo[p>-o$2(;/PAS*h4dDL?NGNK7
Xj<aViJ>sT<Upm[U_@[gDA!;F^QPN=e<*O.@ABG^mr:LbC0^38``N/<2==p]Ap:TIreL0cjjG
D53TO=j#%.\jO_\(WJl7-_Z`V]A;m#tgfZ>M-Uj4-U<`hF/9eTCqjHWEt]A'0_@t\0d#_lI<MC
p7E7;=R7Pa,iH5Uqi\sTZ>.?\2iG;l59KF.J,2q7qEDl;>@@q0KI43rt9aA>Lj_k*0Nc/51^
L.Qc;5)&QZK_,,kaVB*ds#+@)FPGIr1=2'-pBW(5&r\%il[,Vc=e*n`1dfI.`fNRo*FiZ=^X
[l$d(P)PK/`JV_?=cn(?9oYbDbk/=uJ==!.D1*"DcAW'io4c/C"(p>/B,Jk"Du#-M`Eg=V)J
@VN<b;00A3BNcIG:u!SSo=N]Aj8;g`L_fgRTib[\8%7Fft(%?Rb'&P7nl1#,pao-$kSN?N%L3
q/4?O#E\)*5F,2(=r\^Mrp'r^lMeNu!Xe!scc(CE(>X[!e#ocA==5rY)ANnD*\caX:DpcX8q
no^pZ'*KL/6^(]A8[/p'[_WR&[HnKk[-B0#lj&VI`1e%I!@N0S:qP`uR[3pT!IqHY'u1cJ[%k
%0'h0(hA$2T>;&Y#spSQg<t6S7_=TE^&!8/.Lm`S/&8#,IMf*k',0gPsn6Ini,3f'.,?uCNd
k?4Y14orO]A+mWU;m_X]A'Q)Im9UWJ^%ea?0dNpe'o653_`s/0%7Qn:J=.:,)+jF(CuOlNNJ8W
r@d>Eg:f#s$:@8j(i4Yf#`Gg9>hI=L>W0pJ=kV(G9f&`W2)=AC9\JDkU0m/%`3^9a[kojp[e
V_6"uJ)gi?+(c^qEoX$9$qa#3N?/"nX\`?%g2G-%iD8`ifUL?MIPk_csq4i50Ha&Jr.R9<#@
SbBm9@eX<-sfLN2iUZgunO(,;Y%5YkQhPetkTRA!V/Wpu\Y6H)q+P.UkD^RRC=0hbia#:rO(
u1P%qG$aEpJ)%inQIWo)*;6B[qcSX-jPZ3HprG)GLeVbm7T:FG`H0F4@\g#SVKGq>DK1tr^@
Nk-tJZ_jll/D/gg!smNk?'\<8T.%bseGaI>oia@dAXf#A2'k[O4d[%@]ATnFr_R=7Aoac!pn`
b\!q_3,<Cbb9HeYc26e,.`YMoiB,777(D`7haZT%Y8W++,$<go<r09bbX"iC'a`40K!R=obN
qXG`]A/N`ccQ'aq/=XA;b9jQ(tY?IkZ6IpRJ:T3DWb?=qhcL[4b"CBq*A1IeZ[;E<kA,%c?P^
LRqG3*gdhn,PHHc50g#cDmeT!V</LN`lMCDLF,s60YoVP8^C%87G@RX&?BeKnUm>-umgER6Z
p6.RS&E,>%K#42`UH3us3f..!OuMq1-/e&,;`W)8X2+ob0ik7.5gR2`%6#1m`H&o_fP>O&ln
_@8cWrTr.TA4\s']A2$f0Df\Rj`5pl$ZF(t>,L:AIs9]AKp%5k-hfS`^_2snqGdjY%g/bMTU^L
4f2WBG`VH!?'4_J8s0-eSVLZcl'KdF+eK"(,BAOt<@btP<P2fqjuG@Nm#_s+q*"?!EbZiOG+
YeGj$6P-qM1n$>9e5pcMG&i;V))FAFS-U_!'NKaDLPG=c(&2cF$s[er/jX9MMfhg@E\a!+)W
M/ck4Zb.*+^kBmE)>EO?6`Fe@.E)W)l$^7:ZJZ3rc@6"6mRPcL>;]AVSLX9oPG2S>Zja04*Ao
imjDpp[PpK!RLo4tTk\Hf!hiQ2lj78)Gh2*D@jJoDEEI/_:5dm2nVs8"0Eh>j2QI$)Rr[&f!
hKF?;OlI!bsURBl6o4>#-ej>S\XV7;0#Z/)mW#+.5!r1Z>ZNE_'=37<;DE.;:FV3d3^I%U:p
=&[/%Osur-o:<\A:LAMpSUGr4;<s9CBOD`"H3H((;([`bX8cC6$V'Jk)WVm_L&#dihu\]A/HT
7$G&OG4<X8-(%N4C\,,#%3Ea*,XpqDlo>BHJr]Ak\[bc>(!*gNPF=:O"&+9[VQ30QE;4L's&V
mGoC3r&)#u(6[c-I(aHEQPPl^9-@-8O/)j2@"V9[qp+Ka;9H5W]AT>u1o>-+AF`TL^KJO`#UM
eqL5k<d>JKdDW>2Uhc(]AA.,t)`If<anR!0J0]A2"BEeX_#9>+?9G8V]AF(XcC_fB)[a.2iaTR8
0BX[U>9E]AL;idU'4o(]A14QqrtM&S7[cEg,@7^[i[?50k686ZE@jcHG>=;09*Hh@dC4EP8aQU
YNA4AF77hZBA_fjkW(N8I#:41ieBP#[UukI[A;UG0#o==lsGGf[U*o*2NGm#2'+1gFrVtRFZ
eunA0ua3]A\=U=AB_E;Knf>UDq\cXfO]AUM+.4sl7Blc3lA'P*81AXUr^;Z#"lp`+.eGu92]A7`
1#F3<l_:S2r#euhk(Xcga#]AS]A4@0PE8Q@jbOGAZR]A48>c$rI9o6Yd72KbjE]A#cl^j5=0J3t=
t54Sn&>tXJpWI*&M:0[s8?.nSnT'U<iauirI4~
]]></IM>
</FRImage>
</Background>
<FileAttrErrorMarker class="com.fr.base.io.FileAttrErrorMarker" pluginID="com.fr.plugin.reportRefresh.v10" oriClass="com.fr.plugin.reportRefresh.ReportExtraRefreshAttr">
<Refresh customClass="false" interval="0.0" state="0"/>
</FileAttrErrorMarker>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
<UPFCR COLUMN="false" ROW="true"/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[288000,864000,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[190500,4076700,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="1" s="0">
<O>
<![CDATA[级别分类]]></O>
<PrivilegeControl/>
<Expand/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList>
<Style horizontal_alignment="2" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="104" foreground="-526345"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m9=p:P?52j<l`oHANJk1NeV(eGmE_9E?$#AiK9)-Pq!5VF_WA/Fr3LL%>KZMaMV%!Zn9C%'T
djEf7=?18R#"(H,PRdg),E0M*M@+#Pj=@7gS2SR%Wi[<R4gKgl^I$7eqt]A8^:iGp2BEWhWJi
s6VQ"bk8-;Mj5Vq>h&EQ2jl>q`io;fspY=*-Iuu6>n9o[Nd<2XphOIe6e=0!gTDd;)Y=8l:^
Bm,LN8iUL]ARGoBaU2B(X-bmpGKnR;D'(d_rkE22;gE!$N:'J?U68kjrOE@XeCt0tDqdZ$]A;J
G59_"'43Pj[NBT4u@:_g#Dl;cm/p)mBRBh+Isd#(rH*g<7i&5DO"Zk9Zd^)NhppJHDJ9s[Zn
#f!Kf@":"kMH=fn3UQi.gZ/?A,GV*nOHIk<\-te;,2o5tTiCFELY!op$>GsK^&PFm]An,SPdK
1J^j"_l-V\s_i"0HaW4NDQ\_^:Ajkh<\1k-1l2'$G0g]AsWOD]AoOEWQeZGjr/\6SFt8<<X"O#
d-YE@edSf*47)cURo?*gkNY>J(F)h^FElU@A']Au*kgAh*po^nekq8mb1DH1XYLWm'#iS$_##
7bGRVtqKPa"BrSh0P,*p`O:k)F6D1L2rbIcpp"hB/>.?Pum;&DR*IuoH'kVG<g?fD,k`:1V/
_=l8^Du;t`90]AW5Fu^!=7??t/VFjjf:+q0ii,Qe$#amepG7]AL"Eb;-est]Ae$C[TKUqO:#nH(
Q6s\JgnM[27>mHQm7:S/=Q4>@+[=V\<59;N&udjD;u>C.f*2_32bFY7iir`4)+lK=npZ[>97
1i/0'Tn:O@Qt.?FS4,TY#d*7n>_m$Vmcr9VU=9#G&STR+*\SY4SgOV.hc7@4^G[>3gig)p?s
am[/<GroU!-[_41^pE+#NIsH/Y#tsp:0"[EmbL1O#<8t@1ggi'^df]A8pj6<Z-`NdgAq4Z<<N
ZZ'M7W:&]An)PISs5S-`A0*t8:$Q_0VL5\LF^`E?%-qqmpURVsm\I39g(ss:rCQ[\J%kd0af7
k_rS(\f:``ncmcBnC7on_(r\Q?sot]AJN0!fN<Il7/s!U>WA(HJ"!jt%=h4i61T[IMo>jSKn`
9P'.rAh]Aa>(tWWN)i/'C8VP3\YQ,PAl;U0#nBbA*gU*:6]A?a<o&Bi9ffXgZFib:U79/n2*lP
>+;LE??G6U>+T9HbU$LeO:4c+0$(G+.Nt/r.V$mhZ>`7&LpoQ+C69:2<k874n"'DK[d&4hY+
"NbnZ2haL^#BGX2')P$94Q"3+f/W]A,>ZeFId/KD5kE0ANG3R7Ao%'l^>UX?5>+B-tPc7r<j9
<=B<Y*Z^am.9/c]AL.*`nmAof&UD%q)`<Oj-?U1&/s`#nKQ-b?78h7Up'8uDlHn%ji_5PiJ8k
"mOHrE5B14r77X3TEr*5V)oZ4(c%4?&`:?X'Yf4jlNNFa;oi^et+QH3_uE%Dd"9^RW^Xj?^+
.F)5ee,8e1KDq%2U=%Z]AR]AN"5_l,<&;AD6;JOY]A&W5YkkOBTSBiU8Ya="O%sQZEFmS)QEG`m
::IYR=Q1SRE7]AnAW8*@gC<t?VX&Z#R;0/8bc#IUXs@*7!S9>0$EFpNpET*a#jslD.#E4`n;:
M*R6Zn7K943/lAGRN+9n!+4^o*,MALgi]A@qb,7OOEIn4Q!AY3m4E^Z5X7>b;nm#MZ;0B.c:j
$Sp*j6-.E5AS.5AeGU,d%:tWU\P$aQT\s8!qor_<*(M+2[Di'Qc#gF<Q-9i1r".k22LWKREK
alhQNI]A9?`;daRcnCD=\!^Ch+%p7+i5lFIDI[:<3@B_0S?i)#;O[gLE$rD1hNS,;XE;2GW="
VG%[qD#$3m$_B"7=T=bZRY!t6iZl2F,qcN"/FVh-0r40JrGB;H-DIh(3);>qZWY>,3pocn6b
s%E-W/X&9[:9+MhSJj?J[Y"o]A"b8iEWi(B'/b:Q!J[("HRU8Xch\Vb8pZRK?-''>nukS1F!^
DED'<KNt]AXM$ZIkW3<WlNqeehqZF%l2;&S\HMTM^T;0:&3&H12>O?ROFc%/69od`P/mL-1lj
P*$+qJ[^f`qfUR%Vo0a:)Om>VlMp=gGV>+j%H6R1d?'<[Ro/<[#&\L-`1n7[cL%A$TTAIr>/
Erc(5_,6`Ft$_ep"Q4L*TS9'lcW!8/f5T]A=Se"nKmj0)Gg=Pe0`am&g2B?Rs[u8i&rDk2,1q
_21DeHUXRIXnF"HC#C5DqB6hCgaenEl4!Wd%]A.@^a(FP#204Fn,,m_<jGMVq3%'QX*$MrchV
>qV>q&h#G"ldj1h:Vs:Ct?H6b.SrDW%(,V?PQ,RsWC;gGjWg^J*e+Pf_4OqI=^Y5i+9efYiR
sDR*35@-=?jB%.7RR3e%g@TD``AV4(7.O.9M38nT94f(7SC$`3hqj=XL"F=%k-igN75c3,:5
)I0#4k;I3O3006`@1Qj1.<uA/Z#ErZgNO8:o[Y!a>l8C.hjfRj2RkO`2Y/l#DiFO5.LboaD0
E<HU&[uS4*J?9Cg&rkt.89e2MPX#9a!>]A:\C2QCtVtO]A!0j-sNZVGX&Ck,Opq`VC1UQ"@Sj3
PC-$YK`H:ufi=%'>qAo^IsuK+JYM40_a^gH9`Q.6'u'nAL:m4V.VSosXmo$krUrPH7WRgI5d
h^DUO!RTaF.TP>O-`15m51dmb"f*H+\0>60<S=[u,t(!?h^&CF]A)d-o/bCb;3((JIp3sUTXe
26&;'K)r7aU><N"1938n)LEnq5mZ>OY&t4Q3#FMHJ=dc<e?m&E.#F>@R["J/?pAqbn5(]AmKG
nF3.UpWS&AGh>,O,!j2I_ZQGhH$(:!Xb8T<;/;;c`.-cT->d"<jG7]Aj(gK3CI)@C^hP2H0p;
!d2QQB8Fq=ir:WTu`7.??<K<b(?@bH"u1_+N$JqBmo;<_eHn]ANalXp[Dt9M7OXR2WW,$_DLp
ig?tnpX<i5>#X-pYn/F"=b9ek=aWFc?9'0510pJ\RdA>L9-=5blJEeK[o%uDVhDsmijBoH7/
blPQ"9rnO:8fKfaC!Z;reu%K8/t3KrE;h"Xr8f'^N]AG#S=IF999dqAJ$1(a0.)s-<sOU[3$r
ZrdBu)8S6an_HnFlNV=[]A6ITf3V<LlROjrC,Ti`N9DK[BQ,r-q__VXTh1YZTNR32^d%RJV1[
"ZZ*EGBgA]ALA6p>XUiG:32+DQ;0l'9q,Nr*iiOK&CkCj(qC/fC"2/K6t#\3a%OMecF7G2!kR
MH+0`_h2+7B29=Uf9"R/?/P1/Q(O:k7EgX5/1'Y^1lo;Fc6oLT]ARDtEa.)3.Er6@M?W=DYu(
/M3AlHA2DeR`Z\%.9Ne/ggSYsl5+7R9pNIh++Vk?Y.r5;LIfW$[R.5)et$KQXM>&I#sDe1gE
GR%LMr+5CTn=C=,_hu,$12nrJ0U^>D;g&em1]AT9pbb?BpQqh"Bj"hL/To7A]A#e*cC]A,[b@)^
V&u;+uKnO#mfN;4Qr#0OqWAHZ#$<\N-hjOQ(Dh)2V[n(ocKmsqneXZ<6i?MaOMU[uP\WYe3Y
@0.R=LTp+A7$W]AaO6s6?P8NGCR@eg)]A[k<?3^"]AQP7%8_Up3Z:Bd_t-45pCQ_-gSNp1*,-AY
Y?h[K!YR3B1/K[olq<1(13FJPgI5c3Z7q!mF-WJFH,-"HM_()0M1Rc<4A)GVl;7$F3e61<8N
%#Mj_mMe!H&VR5<ML$$S,_Q0M^fqctmD&at2iTHI"CkREH*V/ajc>Hb<B8G9k%d7,M9Yl2ga
TL/859MIFaF8hafA.X(5QqoPpqSpFI/lJY4k3;FX`PIRLQL>p4a%1VgP&HC,.A,\:!Bs5@sG
"18Q=PD/7Yckb(\*4aS^aP+qttmo$<`WGu,9@8rPW<X9F5Q-Z<;aY5\5Bc:U!O2f0rXO_X,'
ETb%Z8J(*#-9A5U>@W@!^(%iGdfju7/OXq.CA!e,_B44eJ8cn@NU8"E5G8qp1lDqKYcSfD9l
-/oZocT6bRKuP[>Q"cN@nHPF9V.0McFui%9LN+u.OhK+ZTkX94)t`q\6s2^<h3CP)TdlYORO
;V_r#U-d]A]A@!D<WYoCmBf']Aa+0F.)^+2(>W]An;gCeP(rfP`I2Fru$Rtp4=21I2d&F;c[F[I4
@Xbdrd.:OO5d;;%P=88&7fEHbOXLmg6u//CXD&(s^f;qTl0eall^hPHOF2I`C_MKU")b\Jj'
6USZk`6#'m_O*A`X.qqh5;hn2:;_^,jYq.8u8VN]AeG^oMNPLfWGI.(38m3#R6Z.Tmi;=nZ3g
hJl,FU5$uF<O#?FLmKFd.DE6=[bblSo%a7/l]AMXIW&]A3:(;7`aFTjf#9r5BR+m0^dP8FtW=X
5-20Y@pj[kZ[7?`d5qK1P\)@j*QA[$gMLCaUH#=(kPH;oZO.\J9!-6[aQ%fB$Sa=DKok<g0*
'6@g:Ya@e8T-Zeec;1=d8!G]Am094652sER/T^NmcTDujc*-b1U4P5j*^L>"]A+BGO7o#IKc#+
h91PWfgb.\N$-O'Jpl`iHb0;guJWU'(9-P;p>%Gt+YZpck^\R\o5u%.O-2NO^hsBBN4sjE*h
2jk.(!.sCt@c2IWk$-&n8Hu^\X3H4HL]Akbh/%B2imHAeZ63[a3X_Fi0L9c3OS`+U<N^FR-mL
0Y^Bk<5U.8T6YGE&r3+FCNu6OFu2;&N+8>4Qqc#[KO2HR[WP6%8YaeMkrQ8f!o<\-*MnV%$b
1(Ze0D[DQC*,%\g`q9[,$;h/ZUQ$q;fCO=3Y8b:DS-%X?1_Gp&BlHM)o<;U2b5CKk_/N[K/r
UR0@Xm8t/6HtUs8Ir*ujCADjLbEFRlPJABS'45Uh":i#pOnnH*8l8k$a=DAhFRKcn#@m907b
?*t<uI7HAY]A%@!3YJg5uW_o?6G^&j8E-THH^.^CYnsX?N~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="250" height="150"/>
</Widget>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[723900,723900,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList/>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList/>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="421" y="354" width="242" height="166"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="report5_c_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report5_c_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="宋体" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="2">
<FRImage fm="png">
<IM>
<![CDATA[m<IeQ*74C;Om"ZY&knAuU:2OZe<$WH.+)h[M)&8AM'+'I7'ro?LT&US&V?sVNR!4)b96YK0l
QKns2=fnpYkI]Af!EZUHgQ7,HM6%<HQrW03bhE)&eYhgB0)L$,UB2Ps7VG:jSs%<kT<D0P'b?
t1tBCX3W$?d7c9]AC"+A46b_^aC:FT8Ng<M-[3K$."4mtCh"IA.V)ANEJ;cCsol,as(#iGOYn
:R3RS%BT25rl%PrJY>YSAMJ;]APOXS<uiGA4/O#5kH?pu7e`CMQTMKCY_d8C$O,a_*HUiqc]A$
u,FaKdEo.N]A_;Gfi[qMaf.:F>UphK'd*5J2t%3dLts3tA>djF//`BY=Y;rK\c\&XWr,GI9DL
[,3*05UlChKmu!J4;6jr]A21H0^".mQ(*#JH$c(;oK09mS98k+QM&)/\Us]A%D4'oRp:I7:Zot
[Wp/T[#9_e_(%e>T]AelQf-Y"27QLj5N8[j-,Y6i6LA/Y#Y>DGb!fpZfXo(N\lcoRP+&rgF)d
>h44->n%8Km/1uS[_Wb5i`KK4f,k_jr*RB'MEVQADL]A"eEjasdk.luk,#laHAn[KWM?]A%j.[
//M&@"GnEOa85C)?P-Xj7OrcO?`1Af?%Ys.4gp8l?3up83b$BA?+B?a+%"&d!Qafm_5l,f;7
/EE$-)jj;AB?a/"(V0.>>>Y6:h3*4Yg[#hO&qcAcX^o#&,dg^E7CI$?IW`iQ<0de='T?0CSS
/nHc>mr$:k@_PDp2d9J1i"(*0f:>uj,#kG'YP=\[OuK8&^U(s?l.B+]Ai4'+kO[l(1:J)]A\28
Fa;_"Z7*N#9S:hr\j7;774*Q&f.lV:jJh2rZCf<L7o/.p'^@XGU)]A_QqD4+65H*0,R$Y-ao6
.b]Al5meHNp#@Qh\E$mKV0^6.9^6r4625@lXi/T!3;eLL2Q\K(d/JA18Himnpla'4$PMYnK@e
CqA/;_1[#NY5-:B$aD_8uN3U8s[R:MeYnQc)QbnG@/$joY&@Ko!MIjRo5>iXq>.`%j-#'J+l
`=^+*PD>p\Z[O&PO)83,3Was/WZ'^38P\tElu!=L:4m)8/=GGU@LQ<AEXTj9F,A>Q9WfbfY3
d6j2kJ8\GPlN:>hhCADnhD>P+9:-OV\0'RXOU;'=5rqsnB=0SQ`O4IK`RQ"H$#bgYU$Lc*7&
7UOGu/_<'Fa*d)priJai)BW-I<7&gt3^DTaaXV%Acq$eX[k%f=dEu0G.QlI[S>el]AbH/l]Ad7
FoQJ(t_VuH+=Na#)]Ap5:6Y_t-;WGgT3@77JX/u_PJ0:T+I%e=CmhY*K2kj%mCk@Z-N9rI?iU
i)`dQe'k/!ot:J*toG9?KNbc*WWLG]A:urq-Bc"E^F+<=89m$tPc!'&lO2Gb$Dr;/0B'1e/bo
f2aJ;j^^eA8+KR-F&<fqX'!pX,#=5SUu0hT.aUuE0AKf./O9_H]A,!l,bp+[OTQ>NLdY]A(UtB
hjK/WB?*2O9oTq/4R?OH?ofL^$f8E;-h:Gp,@(?^K+AW]AJ&T<oGt?*&p"923V/$RU+;;qD-e
R'-7l62d+k1Jb^./=_+SMfL*:Qgb?gqi?/ha7\rn84g`rc#[+N+cXD^=m%D1%++@Jp!Yh$4k
-+2Zio<!V=X3AP08[TeQTN#`8a37&mK95X2^n&1GX[7r2l("1[p5N\NI6kZN&OOs?O`EkJoq
=]Ao,[J]AltS(a9Wa;W_84%_GU%_0l7=Gg(d?/`#Iq!5tu5P@cHG9>MLRE?&u(B?44\MYFuf4V
r.@@f%A^b6b`S5o5TU&(_'"'PXep6!PG3^*FIq9l#oq$(<6a&(cX`t0Hjh#1]AOcMMkI0k!K'
]A08A"m?e?@M!mGG>+!I4%Ot8`6h?<jLX43&0q(Mo\Nk!sZ[fqO:+90K>"4&]A>?@:t3]AX1MlC
C>gn&MpTU9c6<]A-T+^_g#,\G4C[ERb`ZbN+SH%QslBV,/kb\I,H?Ig,n-5HR3-$jbi@H9EVT
FPMH2H58of>!8^:Z*D5CA^DR?g:'LmV*ocilO/"XJOE^:Q%`jmR0pfYJnXJl9fe6ErXf]Ai?.
MVS;[F;<eO`a;),?$l2]A=,C,[UtWclW6$8=pb"/!F(#Qn_qI?=7QY]AGTWkfPXZa$r=.PYQr,
2Hf&,(F,N'u557YK('!-=0!QR#!LU[;F;$*<=8`3p:7C'&b4WO?MPHrY1%&4LT&:aQTqQMRO
FCp88)%iGJ$RR>M.1X<lKPl4//r72VF$KsDbP\==(aRuE-1.H%M=_j?D"L1\nA:\S,@Zhh7X
JcscE)/lMU9Bgr#?mk7SZO/:3<&2>Y939=jODk4uUZm8B>6W=3,8+1FKr1A5YM+;]A_9C2^!Q
J`/!6rZ[1&<h(l#7AY<%jSIFLr8^j/ulXDmmD^p(sH_'G^*s)ZNH*RCW7Mi.nbN)p,FYVZ&b
@LZ9,<;U['oUfSJ#gK[1gHSD3G23!T(cH@OhBr=AB.;\Kp#llU6sSLRW$MT/CO#&?gWlV#FC
GL5WD.nX*oLKf@G+7q8J"#m'[P?YKu1&gK3pGYIfhjL/XbgHY:Ng/2\1pp5qNY'slqi4ZU$;
44(`56pcGJi=N[c^FQh("EuOb(Mk%J]At(ZqhYhdqU<AsGcFc<3ZO6;Fn+.g5_(bYK8rDY$_(
88?,BQANT_%pBGQ:fZ8iQWIJdj$D:Po`@-"ZqqNDTP#+?j"ns3UOHKj0^i:i%1$D\ofD'A;a
r0>q^mmn796+/)]As]A&L+a[ddtc1FS'Bj@pKq?\q:B[/FpKFRd<r?4rD`SqeXIO)NI0OF//o,
pR]AqGX=Tao&qfC/loqM.$fN3394D>TCP8"EA,e[J^,?FpE#WlPiV>0lWoeV4J7ao;1aIS<q/
EJ+o-W$OT*jiC)71J!W2o5rs/T("XhePlm!aM.bfN<?Z4^nT_0;X?o+jLl+kD2S=#m1r&Q7%
nl"K=Z?L-p!sU)>es'kf=V1C@4)2PkjLV;0n#7_?>NY&#hce-qN+5cg#=.rs+KQZpF#cN?"u
O4e,msr^Xhb]A%3/NIgD0]A_o\CL%Q15lkD(Zs+`.Or[4c(t[L=8+R;CuMW:HQSO;,0r2ACg0[
8rZM+b(D,ik_e%$FI^Q`-rT'?1H#,giY8WG%R_(YlS;14Z&>5h;Jc\/)lpct_UB7NLP=)4lU
lethLR!(,GG,r)b-JTRkhP6h;r;#[A+"aXmCVM-+s>G^Aq9Z^^ntj2dZ3ptg8K3;*K&3UmAn
'1\9^Bj\,76*>Y%:3gq`%c"ad(+,hu4G#=F2'KV6TU+euK:TslINKNuD64TFRAVET5V>D:1W
5n-Jn8dMd;0&KX(#K_L6Gp!O[Cp*lnYAp<,LY\LhGOKZiJI7sPDalJ%\/b#G^]A+#j!MRe_Ml
5Y-^bGod*\`0?4pcCu^:+P7j#OO?`.e[O+_*]A!OX=YJa)WX;*j\K]A&$_c?8lCt7AVYS(rtPm
Q"H_1f?Yrt_>cU/_LL$sZ#BZV=$+lmQ1Y5Db?k.G!#e[M^`t-eg_7@aK8oKupb,d?5qs!p)n
_o8rY7UbrI$DmHl7]A8Gbrn65\dU6jWB?Z\D`_t5=npr)`=B1e3M.$$]A.9J'[__$K-n"/cUXd
>sG@&TI+c#EF_%aeI6SV(9Ro?)-*TOnR@Yr((537D/GBAa>_cP2n2F/)VIfZD4)fg#=7hl*s
?Ag>N7MB$-7+,ogXa2-#7!kab!`(U+3CG.o(7Y@\o>,l;J*nUWp9/]A6/g8:&&&G_g%B^S]A+N
uSo"PH6ro-JLnb;d5*e1,:`WM^[HU\6S:D+Db>pa_,Jqu0?gWHJ":'X4-8mL^J5o))ko)M.\
Lb!9K4(?hnhF7g0QV<2@GQT$E,]A9bQA>f9f$!)AbBs)b8H&"N0k8XW&%%!0]AJ?rJ0NaXhMj$
:?BgB+A0Y.;0/C=p=*4/mZ\0HWO>^H,S6o$5QFRQ\!QA5:e(]A=V)gJ1SQtL_7o:B6:)9XFp8
/Zl(9uV8R.TBi?Kfm<ALms#tJ7IfQ//#&_c&"<,UH\b.C-1gZ[A)jKOSVU_?u!8AFCuTBTh'
/0T;ZV]ABW]AbE,!eM2PNK*^Hg8pB"mQSEng%/;QH[1lBqnW2E:pT5E?QcA&)=cLs/[W]A1aL<g
DQtA2WrAZY>SO8Q#WJ5d2Hl'8.O-K+uA@NQ<bV$:QL5(n`>b`9k1PWr[$TkI.Ii%%ZV-9)TQ
d5Z6j8dkc9De:KBCHS1pfpMIKpDE#m_FYM?2e(6ga"QmE/Pq@(pfNB;Zgnj:SV42V'q&qYJL
Ve')-LEZ.<4^3lm:=)lm@:=2;O/@U`bd'BJr9@,6,&Vo<oXCm8pMh\^1`#RfJ';p>#nhf`lk
\*-1Aru]A%q4#+j[Y8[7Bd*EBCW7j:j!VD;4E#liFn)6Hg#q(#u<C4H2-)Dr-:b$E\$U;FklW
Th$#F"W7#4,>rd`O^)HYellFFf!<4ID?Bd2DQWd\8pu+RXYO)TeTnLWK*pT;q$[;$'bNd9%R
P^4^kDWS?\7>6QQ'2n*EU>X?'!,ZhRaEPY4Ke=ooiErqG_[:BVK+qgq0d4)#GJj?0"%6=+V@
i8AgI#lRYhC1H2He=YSB+T8)6#Zt=$>IaK)/8'uIMQ3kMickJPh%LQ]A*l2[@5U6b0F`?OkRC
O_7H<lHP:c$"W1B`IV@7r!3qB\=2a\m)ZuSu^>(>ADifYk!M*VUaHd`a@6CE'p_['U)WLHu/
D8[2.huZt+fIk'`MsHQej]A>Ri*VZgnd,K^du0"To,*T*QtG#L&goF.Yj.LZW28qc]A#dG]A&`=
a?<9N1hcA6l=D-R'VWMWDJGP_BUKbY8c&,GShp-TqE'utB7R^GN4sL8o3kr999`)J6HCb2<,
sfocpjl/Btfp>$m!/N-HU-^T5;Z#EWtUN6B_Cr]A?8bN1+Gua&TRUr2"lGp+B]AI\[(XM&<LiO
6Hn/V-:T1=]A5=XrbcN6"hmFmnk8;+dmTq0.qkQn]A<r^CAi;9oCr(U:djA6En3-.^Z3KMAiqH
#iQ>-YtcW[Sbh9c(_G[r$f1M'k;NhX=?3KKZlYYI=7]Aa61M"J?b^5kJ,;Tu%>Ua<XUnULS2R
Hm@I6atJ(""-!hbSkh06Z*cF*fQ]A1T9A8J&!'o"'nsKD%O\c_"#5kl.n'A9,^b6^?%`l4IA^
39E&n^(\pT;4/_T>N17uZ"X8DGKLF4F=Is!Ma,,t[86MQ;X2R+a0XVj<I4]A2,$S1:("p@GgL
&tg"#g_8<.#E9h7^>AIR0/`:[GPK%Km6+k&.@]AnnT3nGk[+>D_2[Fa2h8a2V#\4;(*'*c[f1
bYmQfTJ<u)%eX()!4[/[M(Gdr98c&A>9,8H>WJ-Suo]A\gYBX2$%#lW2c,j[/F>E()*Pu(/BQ
.SCmBHZ0@<f3\DVb9f'g>i$W^Vg1V_osZ^,ROZ<gc>3[=(Keg#s,![GH4"c(Wtmfr?3&>pQ"
NTD4Xj/AuX0h2VO[4PZh6KLQn6o"cLdnA`A2'IV@V\9F\7%oB@eJrRV'Z=!`2G*:Q+/Gb1/H
eC)"<+.a*WdSY36-BV^AS#2mna>LQ?J^b.MA%F7LKhj`/W=EB00H=Hlhq&"p_jjpbjfQ4`qu
!76i_6SE4JDEE0hQ,jaXHt+cSdSK]A8>Go3j2>qgT'8Ff^(BQq#2Bpo0'Up'$6;\MM?;Q+3B'
\."Ff!qBK=598m0fC:73r"a98J@mW=L$FcmZNa\>_]A`'_[*cUH#9KVmM2T*<$qieHM@rq;$:
GQV?Pu.__r@?jnk2FRr\F%$lpfjUO0tI<unX8&K2(5TK-)[TRfrpjlFS!^Gbb1#iC;=:^h9j
g?kI:I&bY>d3N2VjijM\Dko_#j!)?d*h"6ssuQ-R7c'U(Y'5lhL'nI'fud2\5ugJ'(tA=;=<
Ttc9M>W-KSd`p,^Jn-UCm(s!rM2EfhZ,qIfkGNTgH)HaX%PR5b*Z`kP[N,pjF-:-^jeHI;kF
ITT\+j4C2J''&X?oht-Og+(K-+tRHZ;W9CnaoMe'/S!T"-j]A5Ad=EmTIReAXn'obbu0QB]A=d
::c%bMO#<l_[`LG,_(@22c@7uWV,$W"/t="?F^:Bum"+J,f<fs&&VT<Nn5VaiE_mo3<p1&'%
2&Mi\0"G*0lhG<c#%>0oP3@ar6*938G79<,g^@e7<`sq[]AJ0f2:p=\PO8$IpKX:rp4*^G=(p
bDPZ:3ZQ'IX$e%F=5OumMaORo$OnXUDFLS*-VGTSE0g/9CjcVS`Ve'1l1MS10p>]AXepciqLn
F(<"p>Xp[:[-oCWXtkLJEb9G/Cir2&O;WEK,'s[mI9nmh,Y5SM>A?j.&@$SfF,P^)";`@q)N
=3DHp^M85P?2".Z(c/CL^/-=Q7%\nn7j_@mXG+[!hbJ55Tgc>VP'!Ia8,GFljK'jH(aj2DFj
d0b'NubTRnmZ;qN<,<JANm\H$i+-#J/b!Uld_fG>2%c<.hj:'k=p$=Y-Ccfn3[C9pnfh89Tk
lATsUS<Ub_K,Yo69T$07cEBYS\JNZfOJWG)K/Sfi+=(@D4\DoH/33O)Ie'UEI"!BTeN]Aq'`2
\K*NTr+.-'26I($er!HKa%ME/tM;4@k2;t`ZLb^/:[[%S?!6usf3DS5mZjcj;W:5#_af@fBL
Hpl:EYI\B='p76OdU-?c`j>X/S8%b3f:77;)+LCD]ASeWi7F96q0tf/.$NIcQEDEr!+nb*B6/
/oVP9K(ApJ^kRGa'BU>`GGgFN(khI\ce=K+N.GD7Ou*@^'PN/@VNnn/n&B8+&2WbG,`<If,8
)D5RECkOmFd`ASIIal#uJf3LHApid\0)BmK2ZH[GE3Hk5*#2$0^l+ARTpn8d!X.h2,3"Pi49
o-O#FT.+n\;L.uNof[hQ0`C&OY!S<Q))7#D3,nS9+>),FP^'#ZY#0P<hVNfV9ES`"+*VNMDE
Ljr'\Nq\0fiU>p>pZ<b*%:m%Gud>E%)W/AWU#YYTiPW@sKc7oM?fW]ABRrhtDI3B1CKYnV/4D
^t#0&KIHYIL0@gE:[DKd2Cr9!;lSYaN,1;98%k-,R/)hSfOgA"fKlisOkj4*,@31%2_Kj3kU
p7m,j)[G6X6NLp1b)mG-IO&$<K(i\-8u5@5D?N-Mh#^JE'mKhD:(ulVV;CN=:\YiinE9)K;%
Z2?Fm1>$'jg^XDZIeu`<;]A&;pY!$E?)A4L5:2*4;,=5XEP[,jI:-MZ<j+CkOcgCI=H=&k>VK
YMQCUg7mWb\H&4)g'1T')So?;UY2H/0E]A2`]AEJ3.rd);E&VT+XWKP25]A9VEB8t-k+EgggQW&
&"c\k<@8MXV1/VQ^;9-%iOe2@>i`5sW]A:lc!B"OZ'K88uNo[p>-o$2(;/PAS*h4dDL?NGNK7
Xj<aViJ>sT<Upm[U_@[gDA!;F^QPN=e<*O.@ABG^mr:LbC0^38``N/<2==p]Ap:TIreL0cjjG
D53TO=j#%.\jO_\(WJl7-_Z`V]A;m#tgfZ>M-Uj4-U<`hF/9eTCqjHWEt]A'0_@t\0d#_lI<MC
p7E7;=R7Pa,iH5Uqi\sTZ>.?\2iG;l59KF.J,2q7qEDl;>@@q0KI43rt9aA>Lj_k*0Nc/51^
L.Qc;5)&QZK_,,kaVB*ds#+@)FPGIr1=2'-pBW(5&r\%il[,Vc=e*n`1dfI.`fNRo*FiZ=^X
[l$d(P)PK/`JV_?=cn(?9oYbDbk/=uJ==!.D1*"DcAW'io4c/C"(p>/B,Jk"Du#-M`Eg=V)J
@VN<b;00A3BNcIG:u!SSo=N]Aj8;g`L_fgRTib[\8%7Fft(%?Rb'&P7nl1#,pao-$kSN?N%L3
q/4?O#E\)*5F,2(=r\^Mrp'r^lMeNu!Xe!scc(CE(>X[!e#ocA==5rY)ANnD*\caX:DpcX8q
no^pZ'*KL/6^(]A8[/p'[_WR&[HnKk[-B0#lj&VI`1e%I!@N0S:qP`uR[3pT!IqHY'u1cJ[%k
%0'h0(hA$2T>;&Y#spSQg<t6S7_=TE^&!8/.Lm`S/&8#,IMf*k',0gPsn6Ini,3f'.,?uCNd
k?4Y14orO]A+mWU;m_X]A'Q)Im9UWJ^%ea?0dNpe'o653_`s/0%7Qn:J=.:,)+jF(CuOlNNJ8W
r@d>Eg:f#s$:@8j(i4Yf#`Gg9>hI=L>W0pJ=kV(G9f&`W2)=AC9\JDkU0m/%`3^9a[kojp[e
V_6"uJ)gi?+(c^qEoX$9$qa#3N?/"nX\`?%g2G-%iD8`ifUL?MIPk_csq4i50Ha&Jr.R9<#@
SbBm9@eX<-sfLN2iUZgunO(,;Y%5YkQhPetkTRA!V/Wpu\Y6H)q+P.UkD^RRC=0hbia#:rO(
u1P%qG$aEpJ)%inQIWo)*;6B[qcSX-jPZ3HprG)GLeVbm7T:FG`H0F4@\g#SVKGq>DK1tr^@
Nk-tJZ_jll/D/gg!smNk?'\<8T.%bseGaI>oia@dAXf#A2'k[O4d[%@]ATnFr_R=7Aoac!pn`
b\!q_3,<Cbb9HeYc26e,.`YMoiB,777(D`7haZT%Y8W++,$<go<r09bbX"iC'a`40K!R=obN
qXG`]A/N`ccQ'aq/=XA;b9jQ(tY?IkZ6IpRJ:T3DWb?=qhcL[4b"CBq*A1IeZ[;E<kA,%c?P^
LRqG3*gdhn,PHHc50g#cDmeT!V</LN`lMCDLF,s60YoVP8^C%87G@RX&?BeKnUm>-umgER6Z
p6.RS&E,>%K#42`UH3us3f..!OuMq1-/e&,;`W)8X2+ob0ik7.5gR2`%6#1m`H&o_fP>O&ln
_@8cWrTr.TA4\s']A2$f0Df\Rj`5pl$ZF(t>,L:AIs9]AKp%5k-hfS`^_2snqGdjY%g/bMTU^L
4f2WBG`VH!?'4_J8s0-eSVLZcl'KdF+eK"(,BAOt<@btP<P2fqjuG@Nm#_s+q*"?!EbZiOG+
YeGj$6P-qM1n$>9e5pcMG&i;V))FAFS-U_!'NKaDLPG=c(&2cF$s[er/jX9MMfhg@E\a!+)W
M/ck4Zb.*+^kBmE)>EO?6`Fe@.E)W)l$^7:ZJZ3rc@6"6mRPcL>;]AVSLX9oPG2S>Zja04*Ao
imjDpp[PpK!RLo4tTk\Hf!hiQ2lj78)Gh2*D@jJoDEEI/_:5dm2nVs8"0Eh>j2QI$)Rr[&f!
hKF?;OlI!bsURBl6o4>#-ej>S\XV7;0#Z/)mW#+.5!r1Z>ZNE_'=37<;DE.;:FV3d3^I%U:p
=&[/%Osur-o:<\A:LAMpSUGr4;<s9CBOD`"H3H((;([`bX8cC6$V'Jk)WVm_L&#dihu\]A/HT
7$G&OG4<X8-(%N4C\,,#%3Ea*,XpqDlo>BHJr]Ak\[bc>(!*gNPF=:O"&+9[VQ30QE;4L's&V
mGoC3r&)#u(6[c-I(aHEQPPl^9-@-8O/)j2@"V9[qp+Ka;9H5W]AT>u1o>-+AF`TL^KJO`#UM
eqL5k<d>JKdDW>2Uhc(]AA.,t)`If<anR!0J0]A2"BEeX_#9>+?9G8V]AF(XcC_fB)[a.2iaTR8
0BX[U>9E]AL;idU'4o(]A14QqrtM&S7[cEg,@7^[i[?50k686ZE@jcHG>=;09*Hh@dC4EP8aQU
YNA4AF77hZBA_fjkW(N8I#:41ieBP#[UukI[A;UG0#o==lsGGf[U*o*2NGm#2'+1gFrVtRFZ
eunA0ua3]A\=U=AB_E;Knf>UDq\cXfO]AUM+.4sl7Blc3lA'P*81AXUr^;Z#"lp`+.eGu92]A7`
1#F3<l_:S2r#euhk(Xcga#]AS]A4@0PE8Q@jbOGAZR]A48>c$rI9o6Yd72KbjE]A#cl^j5=0J3t=
t54Sn&>tXJpWI*&M:0[s8?.nSnT'U<iauirI4~
]]></IM>
</FRImage>
</Background>
<Alpha alpha="1.0"/>
</Border>
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="2">
<FRImage fm="png">
<IM>
<![CDATA[m<IeQ*74C;Om"ZY&knAuU:2OZe<$WH.+)h[M)&8AM'+'I7'ro?LT&US&V?sVNR!4)b96YK0l
QKns2=fnpYkI]Af!EZUHgQ7,HM6%<HQrW03bhE)&eYhgB0)L$,UB2Ps7VG:jSs%<kT<D0P'b?
t1tBCX3W$?d7c9]AC"+A46b_^aC:FT8Ng<M-[3K$."4mtCh"IA.V)ANEJ;cCsol,as(#iGOYn
:R3RS%BT25rl%PrJY>YSAMJ;]APOXS<uiGA4/O#5kH?pu7e`CMQTMKCY_d8C$O,a_*HUiqc]A$
u,FaKdEo.N]A_;Gfi[qMaf.:F>UphK'd*5J2t%3dLts3tA>djF//`BY=Y;rK\c\&XWr,GI9DL
[,3*05UlChKmu!J4;6jr]A21H0^".mQ(*#JH$c(;oK09mS98k+QM&)/\Us]A%D4'oRp:I7:Zot
[Wp/T[#9_e_(%e>T]AelQf-Y"27QLj5N8[j-,Y6i6LA/Y#Y>DGb!fpZfXo(N\lcoRP+&rgF)d
>h44->n%8Km/1uS[_Wb5i`KK4f,k_jr*RB'MEVQADL]A"eEjasdk.luk,#laHAn[KWM?]A%j.[
//M&@"GnEOa85C)?P-Xj7OrcO?`1Af?%Ys.4gp8l?3up83b$BA?+B?a+%"&d!Qafm_5l,f;7
/EE$-)jj;AB?a/"(V0.>>>Y6:h3*4Yg[#hO&qcAcX^o#&,dg^E7CI$?IW`iQ<0de='T?0CSS
/nHc>mr$:k@_PDp2d9J1i"(*0f:>uj,#kG'YP=\[OuK8&^U(s?l.B+]Ai4'+kO[l(1:J)]A\28
Fa;_"Z7*N#9S:hr\j7;774*Q&f.lV:jJh2rZCf<L7o/.p'^@XGU)]A_QqD4+65H*0,R$Y-ao6
.b]Al5meHNp#@Qh\E$mKV0^6.9^6r4625@lXi/T!3;eLL2Q\K(d/JA18Himnpla'4$PMYnK@e
CqA/;_1[#NY5-:B$aD_8uN3U8s[R:MeYnQc)QbnG@/$joY&@Ko!MIjRo5>iXq>.`%j-#'J+l
`=^+*PD>p\Z[O&PO)83,3Was/WZ'^38P\tElu!=L:4m)8/=GGU@LQ<AEXTj9F,A>Q9WfbfY3
d6j2kJ8\GPlN:>hhCADnhD>P+9:-OV\0'RXOU;'=5rqsnB=0SQ`O4IK`RQ"H$#bgYU$Lc*7&
7UOGu/_<'Fa*d)priJai)BW-I<7&gt3^DTaaXV%Acq$eX[k%f=dEu0G.QlI[S>el]AbH/l]Ad7
FoQJ(t_VuH+=Na#)]Ap5:6Y_t-;WGgT3@77JX/u_PJ0:T+I%e=CmhY*K2kj%mCk@Z-N9rI?iU
i)`dQe'k/!ot:J*toG9?KNbc*WWLG]A:urq-Bc"E^F+<=89m$tPc!'&lO2Gb$Dr;/0B'1e/bo
f2aJ;j^^eA8+KR-F&<fqX'!pX,#=5SUu0hT.aUuE0AKf./O9_H]A,!l,bp+[OTQ>NLdY]A(UtB
hjK/WB?*2O9oTq/4R?OH?ofL^$f8E;-h:Gp,@(?^K+AW]AJ&T<oGt?*&p"923V/$RU+;;qD-e
R'-7l62d+k1Jb^./=_+SMfL*:Qgb?gqi?/ha7\rn84g`rc#[+N+cXD^=m%D1%++@Jp!Yh$4k
-+2Zio<!V=X3AP08[TeQTN#`8a37&mK95X2^n&1GX[7r2l("1[p5N\NI6kZN&OOs?O`EkJoq
=]Ao,[J]AltS(a9Wa;W_84%_GU%_0l7=Gg(d?/`#Iq!5tu5P@cHG9>MLRE?&u(B?44\MYFuf4V
r.@@f%A^b6b`S5o5TU&(_'"'PXep6!PG3^*FIq9l#oq$(<6a&(cX`t0Hjh#1]AOcMMkI0k!K'
]A08A"m?e?@M!mGG>+!I4%Ot8`6h?<jLX43&0q(Mo\Nk!sZ[fqO:+90K>"4&]A>?@:t3]AX1MlC
C>gn&MpTU9c6<]A-T+^_g#,\G4C[ERb`ZbN+SH%QslBV,/kb\I,H?Ig,n-5HR3-$jbi@H9EVT
FPMH2H58of>!8^:Z*D5CA^DR?g:'LmV*ocilO/"XJOE^:Q%`jmR0pfYJnXJl9fe6ErXf]Ai?.
MVS;[F;<eO`a;),?$l2]A=,C,[UtWclW6$8=pb"/!F(#Qn_qI?=7QY]AGTWkfPXZa$r=.PYQr,
2Hf&,(F,N'u557YK('!-=0!QR#!LU[;F;$*<=8`3p:7C'&b4WO?MPHrY1%&4LT&:aQTqQMRO
FCp88)%iGJ$RR>M.1X<lKPl4//r72VF$KsDbP\==(aRuE-1.H%M=_j?D"L1\nA:\S,@Zhh7X
JcscE)/lMU9Bgr#?mk7SZO/:3<&2>Y939=jODk4uUZm8B>6W=3,8+1FKr1A5YM+;]A_9C2^!Q
J`/!6rZ[1&<h(l#7AY<%jSIFLr8^j/ulXDmmD^p(sH_'G^*s)ZNH*RCW7Mi.nbN)p,FYVZ&b
@LZ9,<;U['oUfSJ#gK[1gHSD3G23!T(cH@OhBr=AB.;\Kp#llU6sSLRW$MT/CO#&?gWlV#FC
GL5WD.nX*oLKf@G+7q8J"#m'[P?YKu1&gK3pGYIfhjL/XbgHY:Ng/2\1pp5qNY'slqi4ZU$;
44(`56pcGJi=N[c^FQh("EuOb(Mk%J]At(ZqhYhdqU<AsGcFc<3ZO6;Fn+.g5_(bYK8rDY$_(
88?,BQANT_%pBGQ:fZ8iQWIJdj$D:Po`@-"ZqqNDTP#+?j"ns3UOHKj0^i:i%1$D\ofD'A;a
r0>q^mmn796+/)]As]A&L+a[ddtc1FS'Bj@pKq?\q:B[/FpKFRd<r?4rD`SqeXIO)NI0OF//o,
pR]AqGX=Tao&qfC/loqM.$fN3394D>TCP8"EA,e[J^,?FpE#WlPiV>0lWoeV4J7ao;1aIS<q/
EJ+o-W$OT*jiC)71J!W2o5rs/T("XhePlm!aM.bfN<?Z4^nT_0;X?o+jLl+kD2S=#m1r&Q7%
nl"K=Z?L-p!sU)>es'kf=V1C@4)2PkjLV;0n#7_?>NY&#hce-qN+5cg#=.rs+KQZpF#cN?"u
O4e,msr^Xhb]A%3/NIgD0]A_o\CL%Q15lkD(Zs+`.Or[4c(t[L=8+R;CuMW:HQSO;,0r2ACg0[
8rZM+b(D,ik_e%$FI^Q`-rT'?1H#,giY8WG%R_(YlS;14Z&>5h;Jc\/)lpct_UB7NLP=)4lU
lethLR!(,GG,r)b-JTRkhP6h;r;#[A+"aXmCVM-+s>G^Aq9Z^^ntj2dZ3ptg8K3;*K&3UmAn
'1\9^Bj\,76*>Y%:3gq`%c"ad(+,hu4G#=F2'KV6TU+euK:TslINKNuD64TFRAVET5V>D:1W
5n-Jn8dMd;0&KX(#K_L6Gp!O[Cp*lnYAp<,LY\LhGOKZiJI7sPDalJ%\/b#G^]A+#j!MRe_Ml
5Y-^bGod*\`0?4pcCu^:+P7j#OO?`.e[O+_*]A!OX=YJa)WX;*j\K]A&$_c?8lCt7AVYS(rtPm
Q"H_1f?Yrt_>cU/_LL$sZ#BZV=$+lmQ1Y5Db?k.G!#e[M^`t-eg_7@aK8oKupb,d?5qs!p)n
_o8rY7UbrI$DmHl7]A8Gbrn65\dU6jWB?Z\D`_t5=npr)`=B1e3M.$$]A.9J'[__$K-n"/cUXd
>sG@&TI+c#EF_%aeI6SV(9Ro?)-*TOnR@Yr((537D/GBAa>_cP2n2F/)VIfZD4)fg#=7hl*s
?Ag>N7MB$-7+,ogXa2-#7!kab!`(U+3CG.o(7Y@\o>,l;J*nUWp9/]A6/g8:&&&G_g%B^S]A+N
uSo"PH6ro-JLnb;d5*e1,:`WM^[HU\6S:D+Db>pa_,Jqu0?gWHJ":'X4-8mL^J5o))ko)M.\
Lb!9K4(?hnhF7g0QV<2@GQT$E,]A9bQA>f9f$!)AbBs)b8H&"N0k8XW&%%!0]AJ?rJ0NaXhMj$
:?BgB+A0Y.;0/C=p=*4/mZ\0HWO>^H,S6o$5QFRQ\!QA5:e(]A=V)gJ1SQtL_7o:B6:)9XFp8
/Zl(9uV8R.TBi?Kfm<ALms#tJ7IfQ//#&_c&"<,UH\b.C-1gZ[A)jKOSVU_?u!8AFCuTBTh'
/0T;ZV]ABW]AbE,!eM2PNK*^Hg8pB"mQSEng%/;QH[1lBqnW2E:pT5E?QcA&)=cLs/[W]A1aL<g
DQtA2WrAZY>SO8Q#WJ5d2Hl'8.O-K+uA@NQ<bV$:QL5(n`>b`9k1PWr[$TkI.Ii%%ZV-9)TQ
d5Z6j8dkc9De:KBCHS1pfpMIKpDE#m_FYM?2e(6ga"QmE/Pq@(pfNB;Zgnj:SV42V'q&qYJL
Ve')-LEZ.<4^3lm:=)lm@:=2;O/@U`bd'BJr9@,6,&Vo<oXCm8pMh\^1`#RfJ';p>#nhf`lk
\*-1Aru]A%q4#+j[Y8[7Bd*EBCW7j:j!VD;4E#liFn)6Hg#q(#u<C4H2-)Dr-:b$E\$U;FklW
Th$#F"W7#4,>rd`O^)HYellFFf!<4ID?Bd2DQWd\8pu+RXYO)TeTnLWK*pT;q$[;$'bNd9%R
P^4^kDWS?\7>6QQ'2n*EU>X?'!,ZhRaEPY4Ke=ooiErqG_[:BVK+qgq0d4)#GJj?0"%6=+V@
i8AgI#lRYhC1H2He=YSB+T8)6#Zt=$>IaK)/8'uIMQ3kMickJPh%LQ]A*l2[@5U6b0F`?OkRC
O_7H<lHP:c$"W1B`IV@7r!3qB\=2a\m)ZuSu^>(>ADifYk!M*VUaHd`a@6CE'p_['U)WLHu/
D8[2.huZt+fIk'`MsHQej]A>Ri*VZgnd,K^du0"To,*T*QtG#L&goF.Yj.LZW28qc]A#dG]A&`=
a?<9N1hcA6l=D-R'VWMWDJGP_BUKbY8c&,GShp-TqE'utB7R^GN4sL8o3kr999`)J6HCb2<,
sfocpjl/Btfp>$m!/N-HU-^T5;Z#EWtUN6B_Cr]A?8bN1+Gua&TRUr2"lGp+B]AI\[(XM&<LiO
6Hn/V-:T1=]A5=XrbcN6"hmFmnk8;+dmTq0.qkQn]A<r^CAi;9oCr(U:djA6En3-.^Z3KMAiqH
#iQ>-YtcW[Sbh9c(_G[r$f1M'k;NhX=?3KKZlYYI=7]Aa61M"J?b^5kJ,;Tu%>Ua<XUnULS2R
Hm@I6atJ(""-!hbSkh06Z*cF*fQ]A1T9A8J&!'o"'nsKD%O\c_"#5kl.n'A9,^b6^?%`l4IA^
39E&n^(\pT;4/_T>N17uZ"X8DGKLF4F=Is!Ma,,t[86MQ;X2R+a0XVj<I4]A2,$S1:("p@GgL
&tg"#g_8<.#E9h7^>AIR0/`:[GPK%Km6+k&.@]AnnT3nGk[+>D_2[Fa2h8a2V#\4;(*'*c[f1
bYmQfTJ<u)%eX()!4[/[M(Gdr98c&A>9,8H>WJ-Suo]A\gYBX2$%#lW2c,j[/F>E()*Pu(/BQ
.SCmBHZ0@<f3\DVb9f'g>i$W^Vg1V_osZ^,ROZ<gc>3[=(Keg#s,![GH4"c(Wtmfr?3&>pQ"
NTD4Xj/AuX0h2VO[4PZh6KLQn6o"cLdnA`A2'IV@V\9F\7%oB@eJrRV'Z=!`2G*:Q+/Gb1/H
eC)"<+.a*WdSY36-BV^AS#2mna>LQ?J^b.MA%F7LKhj`/W=EB00H=Hlhq&"p_jjpbjfQ4`qu
!76i_6SE4JDEE0hQ,jaXHt+cSdSK]A8>Go3j2>qgT'8Ff^(BQq#2Bpo0'Up'$6;\MM?;Q+3B'
\."Ff!qBK=598m0fC:73r"a98J@mW=L$FcmZNa\>_]A`'_[*cUH#9KVmM2T*<$qieHM@rq;$:
GQV?Pu.__r@?jnk2FRr\F%$lpfjUO0tI<unX8&K2(5TK-)[TRfrpjlFS!^Gbb1#iC;=:^h9j
g?kI:I&bY>d3N2VjijM\Dko_#j!)?d*h"6ssuQ-R7c'U(Y'5lhL'nI'fud2\5ugJ'(tA=;=<
Ttc9M>W-KSd`p,^Jn-UCm(s!rM2EfhZ,qIfkGNTgH)HaX%PR5b*Z`kP[N,pjF-:-^jeHI;kF
ITT\+j4C2J''&X?oht-Og+(K-+tRHZ;W9CnaoMe'/S!T"-j]A5Ad=EmTIReAXn'obbu0QB]A=d
::c%bMO#<l_[`LG,_(@22c@7uWV,$W"/t="?F^:Bum"+J,f<fs&&VT<Nn5VaiE_mo3<p1&'%
2&Mi\0"G*0lhG<c#%>0oP3@ar6*938G79<,g^@e7<`sq[]AJ0f2:p=\PO8$IpKX:rp4*^G=(p
bDPZ:3ZQ'IX$e%F=5OumMaORo$OnXUDFLS*-VGTSE0g/9CjcVS`Ve'1l1MS10p>]AXepciqLn
F(<"p>Xp[:[-oCWXtkLJEb9G/Cir2&O;WEK,'s[mI9nmh,Y5SM>A?j.&@$SfF,P^)";`@q)N
=3DHp^M85P?2".Z(c/CL^/-=Q7%\nn7j_@mXG+[!hbJ55Tgc>VP'!Ia8,GFljK'jH(aj2DFj
d0b'NubTRnmZ;qN<,<JANm\H$i+-#J/b!Uld_fG>2%c<.hj:'k=p$=Y-Ccfn3[C9pnfh89Tk
lATsUS<Ub_K,Yo69T$07cEBYS\JNZfOJWG)K/Sfi+=(@D4\DoH/33O)Ie'UEI"!BTeN]Aq'`2
\K*NTr+.-'26I($er!HKa%ME/tM;4@k2;t`ZLb^/:[[%S?!6usf3DS5mZjcj;W:5#_af@fBL
Hpl:EYI\B='p76OdU-?c`j>X/S8%b3f:77;)+LCD]ASeWi7F96q0tf/.$NIcQEDEr!+nb*B6/
/oVP9K(ApJ^kRGa'BU>`GGgFN(khI\ce=K+N.GD7Ou*@^'PN/@VNnn/n&B8+&2WbG,`<If,8
)D5RECkOmFd`ASIIal#uJf3LHApid\0)BmK2ZH[GE3Hk5*#2$0^l+ARTpn8d!X.h2,3"Pi49
o-O#FT.+n\;L.uNof[hQ0`C&OY!S<Q))7#D3,nS9+>),FP^'#ZY#0P<hVNfV9ES`"+*VNMDE
Ljr'\Nq\0fiU>p>pZ<b*%:m%Gud>E%)W/AWU#YYTiPW@sKc7oM?fW]ABRrhtDI3B1CKYnV/4D
^t#0&KIHYIL0@gE:[DKd2Cr9!;lSYaN,1;98%k-,R/)hSfOgA"fKlisOkj4*,@31%2_Kj3kU
p7m,j)[G6X6NLp1b)mG-IO&$<K(i\-8u5@5D?N-Mh#^JE'mKhD:(ulVV;CN=:\YiinE9)K;%
Z2?Fm1>$'jg^XDZIeu`<;]A&;pY!$E?)A4L5:2*4;,=5XEP[,jI:-MZ<j+CkOcgCI=H=&k>VK
YMQCUg7mWb\H&4)g'1T')So?;UY2H/0E]A2`]AEJ3.rd);E&VT+XWKP25]A9VEB8t-k+EgggQW&
&"c\k<@8MXV1/VQ^;9-%iOe2@>i`5sW]A:lc!B"OZ'K88uNo[p>-o$2(;/PAS*h4dDL?NGNK7
Xj<aViJ>sT<Upm[U_@[gDA!;F^QPN=e<*O.@ABG^mr:LbC0^38``N/<2==p]Ap:TIreL0cjjG
D53TO=j#%.\jO_\(WJl7-_Z`V]A;m#tgfZ>M-Uj4-U<`hF/9eTCqjHWEt]A'0_@t\0d#_lI<MC
p7E7;=R7Pa,iH5Uqi\sTZ>.?\2iG;l59KF.J,2q7qEDl;>@@q0KI43rt9aA>Lj_k*0Nc/51^
L.Qc;5)&QZK_,,kaVB*ds#+@)FPGIr1=2'-pBW(5&r\%il[,Vc=e*n`1dfI.`fNRo*FiZ=^X
[l$d(P)PK/`JV_?=cn(?9oYbDbk/=uJ==!.D1*"DcAW'io4c/C"(p>/B,Jk"Du#-M`Eg=V)J
@VN<b;00A3BNcIG:u!SSo=N]Aj8;g`L_fgRTib[\8%7Fft(%?Rb'&P7nl1#,pao-$kSN?N%L3
q/4?O#E\)*5F,2(=r\^Mrp'r^lMeNu!Xe!scc(CE(>X[!e#ocA==5rY)ANnD*\caX:DpcX8q
no^pZ'*KL/6^(]A8[/p'[_WR&[HnKk[-B0#lj&VI`1e%I!@N0S:qP`uR[3pT!IqHY'u1cJ[%k
%0'h0(hA$2T>;&Y#spSQg<t6S7_=TE^&!8/.Lm`S/&8#,IMf*k',0gPsn6Ini,3f'.,?uCNd
k?4Y14orO]A+mWU;m_X]A'Q)Im9UWJ^%ea?0dNpe'o653_`s/0%7Qn:J=.:,)+jF(CuOlNNJ8W
r@d>Eg:f#s$:@8j(i4Yf#`Gg9>hI=L>W0pJ=kV(G9f&`W2)=AC9\JDkU0m/%`3^9a[kojp[e
V_6"uJ)gi?+(c^qEoX$9$qa#3N?/"nX\`?%g2G-%iD8`ifUL?MIPk_csq4i50Ha&Jr.R9<#@
SbBm9@eX<-sfLN2iUZgunO(,;Y%5YkQhPetkTRA!V/Wpu\Y6H)q+P.UkD^RRC=0hbia#:rO(
u1P%qG$aEpJ)%inQIWo)*;6B[qcSX-jPZ3HprG)GLeVbm7T:FG`H0F4@\g#SVKGq>DK1tr^@
Nk-tJZ_jll/D/gg!smNk?'\<8T.%bseGaI>oia@dAXf#A2'k[O4d[%@]ATnFr_R=7Aoac!pn`
b\!q_3,<Cbb9HeYc26e,.`YMoiB,777(D`7haZT%Y8W++,$<go<r09bbX"iC'a`40K!R=obN
qXG`]A/N`ccQ'aq/=XA;b9jQ(tY?IkZ6IpRJ:T3DWb?=qhcL[4b"CBq*A1IeZ[;E<kA,%c?P^
LRqG3*gdhn,PHHc50g#cDmeT!V</LN`lMCDLF,s60YoVP8^C%87G@RX&?BeKnUm>-umgER6Z
p6.RS&E,>%K#42`UH3us3f..!OuMq1-/e&,;`W)8X2+ob0ik7.5gR2`%6#1m`H&o_fP>O&ln
_@8cWrTr.TA4\s']A2$f0Df\Rj`5pl$ZF(t>,L:AIs9]AKp%5k-hfS`^_2snqGdjY%g/bMTU^L
4f2WBG`VH!?'4_J8s0-eSVLZcl'KdF+eK"(,BAOt<@btP<P2fqjuG@Nm#_s+q*"?!EbZiOG+
YeGj$6P-qM1n$>9e5pcMG&i;V))FAFS-U_!'NKaDLPG=c(&2cF$s[er/jX9MMfhg@E\a!+)W
M/ck4Zb.*+^kBmE)>EO?6`Fe@.E)W)l$^7:ZJZ3rc@6"6mRPcL>;]AVSLX9oPG2S>Zja04*Ao
imjDpp[PpK!RLo4tTk\Hf!hiQ2lj78)Gh2*D@jJoDEEI/_:5dm2nVs8"0Eh>j2QI$)Rr[&f!
hKF?;OlI!bsURBl6o4>#-ej>S\XV7;0#Z/)mW#+.5!r1Z>ZNE_'=37<;DE.;:FV3d3^I%U:p
=&[/%Osur-o:<\A:LAMpSUGr4;<s9CBOD`"H3H((;([`bX8cC6$V'Jk)WVm_L&#dihu\]A/HT
7$G&OG4<X8-(%N4C\,,#%3Ea*,XpqDlo>BHJr]Ak\[bc>(!*gNPF=:O"&+9[VQ30QE;4L's&V
mGoC3r&)#u(6[c-I(aHEQPPl^9-@-8O/)j2@"V9[qp+Ka;9H5W]AT>u1o>-+AF`TL^KJO`#UM
eqL5k<d>JKdDW>2Uhc(]AA.,t)`If<anR!0J0]A2"BEeX_#9>+?9G8V]AF(XcC_fB)[a.2iaTR8
0BX[U>9E]AL;idU'4o(]A14QqrtM&S7[cEg,@7^[i[?50k686ZE@jcHG>=;09*Hh@dC4EP8aQU
YNA4AF77hZBA_fjkW(N8I#:41ieBP#[UukI[A;UG0#o==lsGGf[U*o*2NGm#2'+1gFrVtRFZ
eunA0ua3]A\=U=AB_E;Knf>UDq\cXfO]AUM+.4sl7Blc3lA'P*81AXUr^;Z#"lp`+.eGu92]A7`
1#F3<l_:S2r#euhk(Xcga#]AS]A4@0PE8Q@jbOGAZR]A48>c$rI9o6Yd72KbjE]A#cl^j5=0J3t=
t54Sn&>tXJpWI*&M:0[s8?.nSnT'U<iauirI4~
]]></IM>
</FRImage>
</Background>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
<UPFCR COLUMN="false" ROW="true"/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[288000,864000,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[190500,4076700,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="0">
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="1" s="0">
<O>
<![CDATA[现金流量分析]]></O>
<PrivilegeControl/>
<Expand/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList>
<Style horizontal_alignment="2" imageLayout="1">
<FRFont name="微软雅黑" style="0" size="104" foreground="-526345"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m94p?;cfF.[LR/&KWY(ZXp20PG>Uj6Bn6gZP%raF((icCm"6Le;EtEp*s)10aB5j/>=iSoJe
0'9/[,omCCh-SL_M.E]AL7Sh_*HKhDMSQA#m'T_mU!7V>KaSSaL9;79Cl5VSD82BF5HZcH[kL
2mYU>cJeu29icPJ2LW*I]AG]A0L4_oj;1LR/:MrW`6g$>nrd307XY]AXR-d)(!1KTdb=/$dROFW
9ca1pq-1rOMS@)gmVq<k<;^48@btcbNm4*H'%E@k2X26ZDGZMn,-r!$'gS;jl=8gcJ1,,6lB
a=78Z'r161(jeNL$f_q1V7hQ10Y.)-s"?E'3N`T:=UkGjcF9dUqOjmZA-2*5mPXf!Cns!(;g
8WG!VFD$&IjG*bC&Jo?ZU\A^'qclo%%]A'^_H-+4+UH_ob)sC:#3%JEGVW2`u>O"7O"B'TPd:
n><,scXbT$(a:cE$<p,gaO'<2eA3`Dj`GSS?bTbLT%>NShjlq1GO32-/c\UH^A\9:iaeYEME
D=rBBBk^AN<he,O$Ap,?mC$ZML7;GafG6>JT23u]AL1s,(Y%r6l6)&oWPT5S-u<VR8P8JE6M.
'C_)#c,H?\pMgVbn[[h=-"ijQ`tds;<5\!hXjV1ma0"/"$?<Kj74\>oI<SK=fB(FV+L5-bPM
urSqBm5/VM6SpNbeu\Lu@n<VVZ(ccTFp<\AILqV6+r]Ao'GSpO;8LA>:/7Pc0#TgCJ#s-YR]Ad
h8dT.8oKr$>9SpU7#&BT/jDgFZs*_+SV8]Al(;eXImrC$Q+bbV(P^[`OJKIq*UHVC4[$b$3hQ
%5eLYU?6]ArGVFFar%TnY6m*dg7;Z,@T!P6HWHa&S_I2P&K,%mc-`[532U,b?D[Nn8pUO:Nmo
YO@Z,U/,=+nP&u6]A9aIKb)V4lqAl+VD3H=ZobMB)+415tfoW8GVB4Z(:>>!^G7?_H<'I#B4o
dbn&mGDYM5IcKpDjP\(FQ;kjIN1th@NXEt33\h.iBEC*>V:R/#(IV,Qp4&JTbiKNrh:PaCOh
O&UPs&V0980Ye\4.\KHerqrHku0OE50'L=3g/nD39if?1!-ro2&/g6q9@g%-Teb[o\F=C!X;
n3?g2UX5EK^UU&9GXg>lXa<"#I+50RaYd,"\n+YH4aec,A?,,>\"$Ao@Z.Q.WINPGB8b#'5]A
#M>L!O6AgUCf,rA7L&*GU('p<F):H!IFG"$D7)rV;XApSg;G?Mhk,NN[>H[5(pGFkGKB68Rt
HZ^#nUgLe3=e?L5L4&fZgWYcKr@_8Tt<+'.ebn?d(=H(hZlBr?d?)5VO[nNqV2,CcV9cRIXc
sA3XDM';>lj)_gQb(rIR-@o/]A'84Y"?#LEdR"TD$E=QD9fCUrQW;i$@RN!5GM,0&1m/lViY3
r@U.$c![/A8oXY?8Ur]AL(ST9)JCKjG=]A=kX^[@PgZ9M.0M_?,loiR6<#@qldI)i#PRUlU,:o
LdjMkbb>a:PBM+:TYYT>Vp`p=Y!_<eE@i_f4C<7O7N)as;os.=e$a$X7t0G+?WU.%,NRn;8P
;u;X_kKiiXH'Xa*6OZZm_nYe8J,ZjYWS?DP`c(6bNkd_qW;QWC")5!B,E;:YZC?of'Fo2W=h
bQGZ8F&VbbaX=l3NV`iG+A7d_4`)SRl$/L`87X4ECWWOdNnL7df0u0lZ*!iRhg='7:a2"b22
.\Wl*=]A^^#/d;cL@#7SYM!POfXZ@"UK#0\,['5-.@05.:]A0E$E<_bd=+5`0d:8k`r.6qZb>V
@eZ)0-gDgtn\>47gV:JC)2#-,XMY[/AD]Al9R*TcW9df,YfKf/A*HgAH![%S94NRO!f6;K2D7
FU(XOFRXPiBtblF'96G`8PtcV]A\7sdCt$1U-CBl^Tj)F72(Rt@+h*JY2C"j%#[rP"d]AhFpA@
oVLH5CdjmZp.BLc3okQ(%'>,B+&>FrBjqHHrou,c[5aoSOM@;O,?(a4dqHYNFIV'03uRJ*U_
T;=bQ1Z+RQ?Tcc*Hkgk/!)&W?VD"G8P2eHOs\H`hR#`PS5qdF$Z=g-fRL*Egq;`jR2MG#8hp
WKM6^B3H9Cc.sGO*'ns8uVAQrdUg"XHRss,PGXNqCR9J^]AQPHa%Uhjrg(J!3d>]ARg1lQ,.SE
t%CmD!d51hg'Ld\[R_tf?]AWeRutLe3ap_sZmPYVXVS%"B@MUdBPYop!idlu/V^Hnrkal&%^P
fsJ%TX*^f='4rX+/;lF<AnNQ(@`9Nj.AciOBjGb<Z8+8XO%oo\kbLGVZhX_#^i:$iV1nRL$k
[EN2PYPR-RL$PkHW`/S]As"F`_NcY]AW&tJpQ385i'JrnGusHSG`?J15qe1ErrsY]A!P(YAjhXe
)PdIVL/Usi0Uj(tR-A>HbK$m?Q?h/ik*j2:fQ`LsL9hgWd0jT+;0W3`J*Lk\!-@l@N)ouE.D
$ChkW_Gl?6]A4(IdIH1<1cT(%a"s+[BnZMD*<-,qEhGbm82FHSko8q\Xc**lZ^NuKa\0ND)+l
1q&G\cZ8t4^q:<J_6_jsFIL$6X%QCTiIJS)&(%&$,qR1:+Q9hT-[Wjd,fO,q+C4c3oL!#\6R
a-\V;di`(X3(#FV&\W4e8)A?N3a(MqD6C!Wo1XH#&_br_:0&F3n(*@r[]AL[oPRBfW,*hT43Z
1[8h4I@W]Ahm.o!]Ah[@5U#t4N_oiJT0U#P*-AE>S4"K&@qI&H5-M$f&Xie&:GV>b_f9[DmQR6
\g+G'j(?mVpbr_R_2gjm#9$FY4>CLI%k,eIn?o*B+YDn%'+\2Lp*rr*)\=4GP9LmA;li3IP#
]A^U'OcK3m8<TkB;'-*k8-&N2d]A*RJ.j^;>!5NeTi=5#]A=D3_>@GMSI02H$5ntT,g5\jd7:7j
3?2C,'6)g&*%Il`mc1[k;-8Mu4BiC/OrhqX4A>65pB&Y($6.aua,]AN>6C!3F^MjF2\pGiOJo
T.H-+K5iLtJ#G$_aZqqn0+%Nd%f#k"r-o!]ArL"063rS_3$C;g2EkTu\Y=MPTi;ohHh=l8Q@i
gR_^&saJ<ru[E+k^VUb-2F-'6s:=Of9f?-Y,QA$ULZEM]A_9\1Ksj/(/5g\jdQ>.df3faVG@"
DVB0C1^-n.(54MjIPJ@"ej?5b`q0486VTDF0i8^>WCs'`L1fCX]Aa$CF`"(Pt3aHbi>p`X.n$
ID\c^`I6A;eRe=%/a]AqSH#YQB!j.Oeq_3&ak?_aOIGnZ_nZC(q\*"o=]AP!"XsPJJ%(uqDi^O
oE4_H>nYhKP+-'aqccA24kB,l4YRi=IkFT"1%YWe1trF(qgTKQG>#[!m48?H,>(a%Ug8#0B9
Nng/2*)ht@&s.PmA)3fZ'l^*=MN.ZlI2n[hR*EYIfZXb9<f;\taaAiaPG3mBoc0+23B+%\Yi
eJX-J*hQj_E,Fg(lA3r[Ji81N7l\rQ"V5H2S\:a1f?uLO[BJgiW0i7/hdo<0#MZD,<rS&"Zj
5(A=QZ,PZhp6P?$)Jlhb)dMR5Kp5IDZ,`[sm;W$P=#BhGhYAGL5BtgRun0!%n^p#V_q'<Njk
K#GP9*4g2\$0c.pe,sk(Z1t(Ff)mU%S2\fd03Y"P=Je7)$+P9olYDgH:K`LA3b>]AG03$j240
9`%&VtC?iTaj[A7Y^i\MADRW+`HVW6QfA&:CU0.\\-@&/HEY0M_+\eaX1V;K48C*Ap;Vbg]A)
,[#e2HTd>'+D=)H,p<[eM)F[+JOdpM]A$gqp:NVUXB%T$1,]AEAJ9m0tRbPrIj-VMu^rPcZ595
obcHBoJce'!aKJpJF1`*=f2\%71_2:tf4%[72C;$*t>W`Jb__hj,:llj2;^\K:J%-+l$b4o1
#"TuMR>GpdVM<_=.aTT3='Q8UKjFu('6f<-5(W?uNN)PuR`]AN$:ch0Hg:F*UB8PZUs8!"5q%
q^iXM=0$lR:E!JNPk=pG]A`;Ti=s.c[B@6(pgP^]A$BNJDO9@%H_^\q7G^l\bk;oL&5QR+r\@o
Y"Y*PXo4%e78\M6W2g9L2d?uIqr<m;@<R"XE%%93#aGD5!03('[o;F^WuDB6csKJ\af?`E"6
%_DAfOS?ke'LmR&=Wp>B+2BS-+a#5B2C(LgHn5O3U]AdY6:Agu%;Q3ri4fbX!fiYkUbDXZQ^?
\220(QhY9,a_WQP0*R8[Tm8h4AEsh0WQ`@!)f-1uADc+S'%I1_G7:qG:+6WRs0"$QMlO/:@F
*'a2s+[+.2p3)8Xo@<&[=^dGfd>fN.15J,)36MfY>Eth+>dqYj_0E>m-oRokS5/T+>AQppZ$
:.^d:_JR'3BYtPYX7[K_XXeEo%?\+7%AYY@k6\q&C\IJ*AEZ1a\o5@gDMMKq0H!-HtuT4@?T
ka;l<01+0UfgEONg1;ke"u*A,+dBMA>g=NCFNYCjLO)CCn86#_]Ad;oi)o!Rp7<dPBd3Q%RQ`
j3\^&i<_6!#Vl\-V$p?+?5I+!<#RIZ[';YpY[0AT@%JY(q!$Lo>.J>`;1*LE.R]As&+Vd$i%h
#X;Jk!(=Rl%XaDnB$(*u&el3'igk"$sU5cX_D6>:/l,0$Uq$H"F^HWRXctEakjX):"Xq9P<9
mr):4cOY/QmkDbXX/-lm%N*$"KMd.:kGVYX]AnHBB1SA"JQm"*N2$[AM."V>5J9_DNQd?[m=I
.3MWZn0+?hR00]AT>"kUU(ZLo))=fWgcRDF_a<r?=<&1f@TO2)&%Z@k7ZadZ0_e3JbmBfA<8o
TEFlJi8/KCDH4,T4mVGm(mp.94T`B;tgb1fVn?<Fga@=R&0`3Vo^fd>8^E2oO#d4&4@:!Dt_
e)Z)5kgH'PW]ATc(]AN00_U8)o5lpDuVYkEOpl6I\Ii;Z)lFUc=M]AEffV94T&lH(KV5"-G(L#B
R\sD:B.O,`O[#bT]A/0>FmTjHNf_'$",;SA2Qa93\!n[9TsY'KE.#5?SP"`&m+S\s";#R,NiY
1#P59V@Z3]ATWmWme(METRa?b.s>?G$\\4p69]Apj';#%$POdAo&6#=>\mc(`^g35)5(?Z3`n`
0ePd]AGNel8)0f_!s0<JJ1t9DBY\cI[6b;=n:H4uHDV.<[*qoBc;\dtO(QA`A&Zo8,rU=ZHnK
([I#>t`aibL?]Ad/[Be.%1J7A@%tSA@Je2N;b:4AIU,2P7[Gr<lS%2U@VeJGoLS`JJWN5$Qn$
p0Q#+rLa'J~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="250" height="150"/>
</Widget>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[723900,723900,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList/>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting/>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList/>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false"/>
</body>
</InnerWidget>
<BoundsAttr x="216" y="354" width="203" height="166"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="chart1_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart1_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.PiePlot4VanChart">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.chart.base.AttrBorder">
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="true" autoAdjust="false" position="6" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
<ConditionAttrList>
<List index="0">
<ConditionAttr name="条件属性1">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrEffect">
<AttrEffect>
<attr enabled="true" period="2.0"/>
</AttrEffect>
</Attr>
</AttrList>
<Condition class="com.fr.chart.chartattr.ChartCommonCondition">
<CNUMBER>
<![CDATA[3]]></CNUMBER>
<CNAME>
<![CDATA[SERIES_NAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[逾期未回]]></O>
</Compare>
</Condition>
</ConditionAttr>
</List>
</ConditionAttrList>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="false"/>
<FRFont name="微软雅黑" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-3584"/>
<OColor colvalue="-46302"/>
<OColor colvalue="-14374913"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<PieAttr4VanChart roseType="normal" startAngle="2.0" endAngle="360.0" innerRadius="70.0" supportRotation="true"/>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<OneValueCDDefinition seriesName="存量金额" valueName="款项金额" function="com.fr.data.util.function.NoneFunction">
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[Embedded3]]></Name>
</TableData>
<CategoryName value="无"/>
</OneValueCDDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="250" height="150"/>
</Widget>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart1"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.PiePlot4VanChart">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.chart.base.AttrBorder">
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="true" autoAdjust="false" position="6" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
<ConditionAttrList>
<List index="0">
<ConditionAttr name="条件属性1">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrEffect">
<AttrEffect>
<attr enabled="true" period="2.0"/>
</AttrEffect>
</Attr>
</AttrList>
<Condition class="com.fr.chart.chartattr.ChartCommonCondition">
<CNUMBER>
<![CDATA[3]]></CNUMBER>
<CNAME>
<![CDATA[SERIES_NAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[逾期未回]]></O>
</Compare>
</Condition>
</ConditionAttr>
</List>
</ConditionAttrList>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="false"/>
<FRFont name="微软雅黑" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-26368"/>
<OColor colvalue="-3407872"/>
<OColor colvalue="-4363512"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<PieAttr4VanChart roseType="normal" startAngle="2.0" endAngle="360.0" innerRadius="65.0" supportRotation="true"/>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<OneValueCDDefinition seriesName="存量金额" valueName="款项金额" function="com.fr.data.util.function.NoneFunction">
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[Embedded3]]></Name>
</TableData>
<CategoryName value="无"/>
</OneValueCDDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</body>
</InnerWidget>
<BoundsAttr x="682" y="225" width="173" height="126"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="chart2_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart2_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[业绩同期同比]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="104" foreground="-10040065"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.column.VanChartColumnPlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.chart.base.AttrBorder">
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="3"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.chart.base.AttrAlpha">
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="true" position="6" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-3355393"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrTrendLine">
<TrendLine>
<Attr trendLineName="" trendLineType="exponential" prePeriod="0" afterPeriod="0"/>
<LineStyleInfo>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
<AttrColor>
<Attr/>
</AttrColor>
<AttrLineStyle>
<newAttr lineStyle="0"/>
</AttrLineStyle>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
</LineStyleInfo>
</TrendLine>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
<ConditionAttrList>
<List index="0">
<ConditionAttr name="条件属性1">
<AttrList>
<Attr class="com.fr.plugin.chart.base.VanChartAttrTrendLine">
<TrendLine>
<Attr trendLineName="" trendLineType="exponential" prePeriod="1" afterPeriod="1"/>
<LineStyleInfo>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
<AttrColor>
<Attr color="-16750900"/>
</AttrColor>
<AttrLineStyle>
<newAttr lineStyle="2"/>
</AttrLineStyle>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
</LineStyleInfo>
</TrendLine>
</Attr>
</AttrList>
<Condition class="com.fr.chart.chartattr.ChartCommonCondition">
<CNUMBER>
<![CDATA[1]]></CNUMBER>
<CNAME>
<![CDATA[CATEGORY_NAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[第四季度]]></O>
</Compare>
</Condition>
</ConditionAttr>
</List>
</ConditionAttrList>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="false"/>
<FRFont name="微软雅黑" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-16713985"/>
<OColor colvalue="-12935169"/>
<OColor colvalue="-6697729"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartRectanglePlotAttr vanChartPlotType="normal" isDefaultIntervalBackground="true"/>
<XAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-526345"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
</VanChartAxis>
</XAxisList>
<YAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-526345"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
</YAxisList>
<stackAndAxisCondition>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
</stackAndAxisCondition>
<VanChartColumnPlotAttr seriesOverlapPercent="20.0" categoryIntervalPercent="20.0" fixedWidth="false" columnWidth="0" filledWithImage="false" isBar="false"/>
</Plot>
<ChartDefinition>
<OneValueCDDefinition seriesName="年份" valueName="金额" function="com.fr.data.util.function.NoneFunction">
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[业绩同期同比]]></Name>
</TableData>
<CategoryName value="季度"/>
</OneValueCDDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="250" height="150"/>
</Widget>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart2"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[业绩同期同比]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13382452"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.column.VanChartColumnPlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.chart.base.AttrBorder">
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="3"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.chart.base.AttrAlpha">
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrTrendLine">
<TrendLine>
<Attr trendLineName="" trendLineType="exponential" prePeriod="0" afterPeriod="0"/>
<LineStyleInfo>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
<AttrColor>
<Attr/>
</AttrColor>
<AttrLineStyle>
<newAttr lineStyle="0"/>
</AttrLineStyle>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
</LineStyleInfo>
</TrendLine>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="true" position="6" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-13408513"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="false"/>
<FRFont name="微软雅黑" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-3407872"/>
<OColor colvalue="-11184811"/>
<OColor colvalue="-4363512"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartRectanglePlotAttr vanChartPlotType="stack" isDefaultIntervalBackground="true"/>
<XAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="72" foreground="-16711681"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
</VanChartAxis>
</XAxisList>
<YAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-16711681"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
</YAxisList>
<stackAndAxisCondition>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
</stackAndAxisCondition>
<VanChartColumnPlotAttr seriesOverlapPercent="20.0" categoryIntervalPercent="20.0" fixedWidth="true" columnWidth="22" filledWithImage="false" isBar="false"/>
</Plot>
<ChartDefinition>
<OneValueCDDefinition seriesName="年份" valueName="金额" function="com.fr.data.util.function.NoneFunction">
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[业绩同期同比]]></Name>
</TableData>
<CategoryName value="季度"/>
</OneValueCDDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</body>
</InnerWidget>
<BoundsAttr x="18" y="240" width="192" height="134"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="chart3_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart3_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[工程售后]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="104" foreground="-16724737"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.PiePlot4VanChart">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.chart.base.AttrBorder">
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="true" autoAdjust="false" position="6" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-3342337"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
<ConditionAttrList>
<List index="0">
<ConditionAttr name="条件属性1">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrEffect">
<AttrEffect>
<attr enabled="true" period="2.0"/>
</AttrEffect>
</Attr>
</AttrList>
<Condition class="com.fr.chart.chartattr.ChartCommonCondition">
<CNUMBER>
<![CDATA[3]]></CNUMBER>
<CNAME>
<![CDATA[SERIES_NAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[已确认收入]]></O>
</Compare>
</Condition>
</ConditionAttr>
</List>
</ConditionAttrList>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="false"/>
<FRFont name="微软雅黑" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-16713985"/>
<OColor colvalue="-23040"/>
<OColor colvalue="-4363512"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<PieAttr4VanChart roseType="differentArc" startAngle="0.0" endAngle="360.0" innerRadius="45.0" supportRotation="true"/>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<OneValueCDDefinition seriesName="金额名称" valueName="合同金额" function="com.fr.data.util.function.NoneFunction">
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[工程售后]]></Name>
</TableData>
<CategoryName value="无"/>
</OneValueCDDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="250" height="150"/>
</Widget>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart3"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[工程售后]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="104" foreground="-16724737"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.PiePlot4VanChart">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.chart.base.AttrBorder">
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="true" autoAdjust="false" position="6" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72" foreground="-3342337"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
<ConditionAttrList>
<List index="0">
<ConditionAttr name="条件属性1">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrEffect">
<AttrEffect>
<attr enabled="true" period="2.0"/>
</AttrEffect>
</Attr>
</AttrList>
<Condition class="com.fr.chart.chartattr.ChartCommonCondition">
<CNUMBER>
<![CDATA[3]]></CNUMBER>
<CNAME>
<![CDATA[SERIES_NAME]]></CNAME>
<Compare op="0">
<O>
<![CDATA[已确认收入]]></O>
</Compare>
</Condition>
</ConditionAttr>
</List>
</ConditionAttrList>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="false"/>
<FRFont name="微软雅黑" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-16737844"/>
<OColor colvalue="-10027162"/>
<OColor colvalue="-4363512"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<PieAttr4VanChart roseType="differentArc" startAngle="0.0" endAngle="360.0" innerRadius="50.0" supportRotation="true"/>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<OneValueCDDefinition seriesName="金额名称" valueName="合同金额" function="com.fr.data.util.function.NoneFunction">
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[工程售后]]></Name>
</TableData>
<CategoryName value="无"/>
</OneValueCDDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</body>
</InnerWidget>
<BoundsAttr x="14" y="394" width="199" height="126"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="chart4_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart4_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.gauge.VanChartGaugePlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="false" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="104" foreground="-16713985"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
<gaugeValueLabel class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="64" foreground="-1"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</gaugeValueLabel>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-16711936"/>
<OColor colvalue="-11184811"/>
<OColor colvalue="-16713985"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartGaugePlotAttr gaugeStyle="slot"/>
<GaugeDetailStyle>
<GaugeDetailStyleAttr horizontalLayout="true" needleColor="-1" slotBackgroundColor="-8020559" antiClockWise="true"/>
<MapHotAreaColor>
<MC_Attr minValue="0.0" maxValue="100.0" useType="0" areaNumber="5" mainColor="-14374913"/>
<ColorList>
<AreaColor>
<AC_Attr minValue="=80" maxValue="=100" color="-14374913"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=60" maxValue="=80" color="-11486721"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=40" maxValue="=60" color="-8598785"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=20" maxValue="=40" color="-5776129"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=0" maxValue="=20" color="-2888193"/>
</AreaColor>
</ColorList>
</MapHotAreaColor>
</GaugeDetailStyle>
<gaugeAxis>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange maxValue="=6790"/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
<VanChartGaugeAxisAttr mainTickColor="-4539718" secTickColor="-1907998"/>
</gaugeAxis>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<MeterTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[当年回款同比分析]]></Name>
</TableData>
<MeterTable201109 meterType="1" name="年份" value="当年实际回款额"/>
</MeterTableDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="250" height="150"/>
</Widget>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart4"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.gauge.VanChartGaugePlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="false" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="104"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
<gaugeValueLabel class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="80" foreground="-10066330"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</gaugeValueLabel>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName="新特性"/>
<isCustomFillStyle isCustomFillStyle="false"/>
<ColorList>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartGaugePlotAttr gaugeStyle="slot"/>
<GaugeDetailStyle>
<GaugeDetailStyleAttr horizontalLayout="true" needleColor="-1" slotBackgroundColor="-1118482" antiClockWise="true"/>
<MapHotAreaColor>
<MC_Attr minValue="0.0" maxValue="100.0" useType="0" areaNumber="5" mainColor="-14374913"/>
<ColorList>
<AreaColor>
<AC_Attr minValue="=80" maxValue="=100" color="-14374913"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=60" maxValue="=80" color="-11486721"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=40" maxValue="=60" color="-8598785"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=20" maxValue="=40" color="-5776129"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=0" maxValue="=20" color="-2888193"/>
</AreaColor>
</ColorList>
</MapHotAreaColor>
</GaugeDetailStyle>
<gaugeAxis>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="verdana" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
<VanChartGaugeAxisAttr mainTickColor="-4539718" secTickColor="-1907998"/>
</gaugeAxis>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<MeterTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[当年回款同比分析]]></Name>
</TableData>
<MeterTable201109 meterType="1" name="年份" value=""/>
</MeterTableDefinition>
</ChartDefinition>
</Chart>
<tools hidden="true" sort="true" export="true" fullScreen="true"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</body>
</InnerWidget>
<BoundsAttr x="665" y="50" width="76" height="158"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="chart4_c_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart4_c_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.gauge.VanChartGaugePlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="false" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="104" foreground="-16713985"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
<gaugeValueLabel class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="64" foreground="-1"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</gaugeValueLabel>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-16713985"/>
<OColor colvalue="-11184811"/>
<OColor colvalue="-16713985"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartGaugePlotAttr gaugeStyle="slot"/>
<GaugeDetailStyle>
<GaugeDetailStyleAttr horizontalLayout="true" needleColor="-16713985" slotBackgroundColor="-8020559" antiClockWise="true"/>
<MapHotAreaColor>
<MC_Attr minValue="0.0" maxValue="100.0" useType="0" areaNumber="5" mainColor="-14374913"/>
<ColorList>
<AreaColor>
<AC_Attr minValue="=80" maxValue="=100" color="-14374913"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=60" maxValue="=80" color="-11486721"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=40" maxValue="=60" color="-8598785"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=20" maxValue="=40" color="-5776129"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=0" maxValue="=20" color="-2888193"/>
</AreaColor>
</ColorList>
</MapHotAreaColor>
</GaugeDetailStyle>
<gaugeAxis>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange maxValue="=6790"/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
<VanChartGaugeAxisAttr mainTickColor="-4539718" secTickColor="-1907998"/>
</gaugeAxis>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<MeterTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[当年回款同比分析]]></Name>
</TableData>
<MeterTable201109 meterType="1" name="年份" value="当年实际回款额"/>
</MeterTableDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="250" height="150"/>
</Widget>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart4"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.gauge.VanChartGaugePlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="false" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="104"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
<gaugeValueLabel class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="80" foreground="-10066330"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</gaugeValueLabel>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName="新特性"/>
<isCustomFillStyle isCustomFillStyle="false"/>
<ColorList>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartGaugePlotAttr gaugeStyle="slot"/>
<GaugeDetailStyle>
<GaugeDetailStyleAttr horizontalLayout="true" needleColor="-1" slotBackgroundColor="-1118482" antiClockWise="true"/>
<MapHotAreaColor>
<MC_Attr minValue="0.0" maxValue="100.0" useType="0" areaNumber="5" mainColor="-14374913"/>
<ColorList>
<AreaColor>
<AC_Attr minValue="=80" maxValue="=100" color="-14374913"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=60" maxValue="=80" color="-11486721"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=40" maxValue="=60" color="-8598785"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=20" maxValue="=40" color="-5776129"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=0" maxValue="=20" color="-2888193"/>
</AreaColor>
</ColorList>
</MapHotAreaColor>
</GaugeDetailStyle>
<gaugeAxis>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="verdana" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
<VanChartGaugeAxisAttr mainTickColor="-4539718" secTickColor="-1907998"/>
</gaugeAxis>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<MeterTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[当年回款同比分析]]></Name>
</TableData>
<MeterTable201109 meterType="1" name="年份" value=""/>
</MeterTableDefinition>
</ChartDefinition>
</Chart>
<tools hidden="true" sort="true" export="true" fullScreen="true"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</body>
</InnerWidget>
<BoundsAttr x="13" y="50" width="76" height="158"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="chart0_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart0_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.gauge.VanChartGaugePlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="false" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="80" foreground="-16719744"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
<gaugeValueLabel class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="64" foreground="-1"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</gaugeValueLabel>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-15118441"/>
<OColor colvalue="-11184811"/>
<OColor colvalue="-16719744"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartGaugePlotAttr gaugeStyle="slot"/>
<GaugeDetailStyle>
<GaugeDetailStyleAttr horizontalLayout="true" needleColor="-1" slotBackgroundColor="-14374913" antiClockWise="true"/>
<MapHotAreaColor>
<MC_Attr minValue="0.0" maxValue="100.0" useType="0" areaNumber="5" mainColor="-14374913"/>
<ColorList>
<AreaColor>
<AC_Attr minValue="=80" maxValue="=100" color="-14374913"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=60" maxValue="=80" color="-11486721"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=40" maxValue="=60" color="-8598785"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=20" maxValue="=40" color="-5776129"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=0" maxValue="=20" color="-2888193"/>
</AreaColor>
</ColorList>
</MapHotAreaColor>
</GaugeDetailStyle>
<gaugeAxis>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange maxValue="=7400"/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
<VanChartGaugeAxisAttr mainTickColor="-4539718" secTickColor="-1907998"/>
</gaugeAxis>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<MeterTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[去年回款同比分析]]></Name>
</TableData>
<MeterTable201109 meterType="1" name="年份" value="去年同期计划回款额"/>
</MeterTableDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="250" height="150"/>
</Widget>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.gauge.VanChartGaugePlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="false" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="88" foreground="-14374913"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
<gaugeValueLabel class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-16724737"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</gaugeValueLabel>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-15118441"/>
<OColor colvalue="-11184811"/>
<OColor colvalue="-16711936"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartGaugePlotAttr gaugeStyle="ring"/>
<GaugeDetailStyle>
<GaugeDetailStyleAttr horizontalLayout="true" paneBackgroundColor="-13408513" innerPaneBackgroundColor="-723724" antiClockWise="true"/>
<MapHotAreaColor>
<MC_Attr minValue="0.0" maxValue="100.0" useType="0" areaNumber="5" mainColor="-14374913"/>
<ColorList>
<AreaColor>
<AC_Attr minValue="=80" maxValue="=100" color="-14374913"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=60" maxValue="=80" color="-11486721"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=40" maxValue="=60" color="-8598785"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=20" maxValue="=40" color="-5776129"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=0" maxValue="=20" color="-2888193"/>
</AreaColor>
</ColorList>
</MapHotAreaColor>
</GaugeDetailStyle>
<gaugeAxis>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange maxValue="=7500"/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
<VanChartGaugeAxisAttr mainTickColor="-4539718" secTickColor="-1907998"/>
</gaugeAxis>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<MeterTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[去年回款同比分析]]></Name>
</TableData>
<MeterTable201109 meterType="1" name="年份" value="去年同期计划回款额"/>
</MeterTableDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</body>
</InnerWidget>
<BoundsAttr x="81" y="36" width="88" height="87"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="chart5_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart5_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.gauge.VanChartGaugePlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="false" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="80" foreground="-16719744"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
<gaugeValueLabel class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="64" foreground="-1"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</gaugeValueLabel>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-15118441"/>
<OColor colvalue="-11184811"/>
<OColor colvalue="-16719744"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartGaugePlotAttr gaugeStyle="slot"/>
<GaugeDetailStyle>
<GaugeDetailStyleAttr horizontalLayout="true" needleColor="-1" slotBackgroundColor="-14374913" antiClockWise="true"/>
<MapHotAreaColor>
<MC_Attr minValue="0.0" maxValue="100.0" useType="0" areaNumber="5" mainColor="-14374913"/>
<ColorList>
<AreaColor>
<AC_Attr minValue="=80" maxValue="=100" color="-14374913"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=60" maxValue="=80" color="-11486721"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=40" maxValue="=60" color="-8598785"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=20" maxValue="=40" color="-5776129"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=0" maxValue="=20" color="-2888193"/>
</AreaColor>
</ColorList>
</MapHotAreaColor>
</GaugeDetailStyle>
<gaugeAxis>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange maxValue="=8700"/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
<VanChartGaugeAxisAttr mainTickColor="-4539718" secTickColor="-1907998"/>
</gaugeAxis>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<MeterTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[去年回款同比分析]]></Name>
</TableData>
<MeterTable201109 meterType="1" name="年份" value="去年同期计划回款额"/>
</MeterTableDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="250" height="150"/>
</Widget>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart5"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.gauge.VanChartGaugePlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="false" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="88" foreground="-16724737"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
<gaugeValueLabel class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-14374913"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</gaugeValueLabel>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-15118441"/>
<OColor colvalue="-11184811"/>
<OColor colvalue="-16711936"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartGaugePlotAttr gaugeStyle="ring"/>
<GaugeDetailStyle>
<GaugeDetailStyleAttr horizontalLayout="true" paneBackgroundColor="-14374913" innerPaneBackgroundColor="-723724" antiClockWise="true"/>
<MapHotAreaColor>
<MC_Attr minValue="0.0" maxValue="100.0" useType="0" areaNumber="5" mainColor="-14374913"/>
<ColorList>
<AreaColor>
<AC_Attr minValue="=80" maxValue="=100" color="-14374913"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=60" maxValue="=80" color="-11486721"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=40" maxValue="=60" color="-8598785"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=20" maxValue="=40" color="-5776129"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=0" maxValue="=20" color="-2888193"/>
</AreaColor>
</ColorList>
</MapHotAreaColor>
</GaugeDetailStyle>
<gaugeAxis>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange maxValue="=10000"/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
<VanChartGaugeAxisAttr mainTickColor="-4539718" secTickColor="-1907998"/>
</gaugeAxis>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<MeterTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[去年回款同比分析]]></Name>
</TableData>
<MeterTable201109 meterType="1" name="年份" value="去年同期计划回款额"/>
</MeterTableDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</body>
</InnerWidget>
<BoundsAttr x="81" y="115" width="88" height="87"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="chart7_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart7_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.gauge.VanChartGaugePlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="false" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="80" foreground="-16719744"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
<gaugeValueLabel class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="64" foreground="-1"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</gaugeValueLabel>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-15118441"/>
<OColor colvalue="-11184811"/>
<OColor colvalue="-16719744"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartGaugePlotAttr gaugeStyle="slot"/>
<GaugeDetailStyle>
<GaugeDetailStyleAttr horizontalLayout="true" needleColor="-1" slotBackgroundColor="-14374913" antiClockWise="true"/>
<MapHotAreaColor>
<MC_Attr minValue="0.0" maxValue="100.0" useType="0" areaNumber="5" mainColor="-14374913"/>
<ColorList>
<AreaColor>
<AC_Attr minValue="=80" maxValue="=100" color="-14374913"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=60" maxValue="=80" color="-11486721"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=40" maxValue="=60" color="-8598785"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=20" maxValue="=40" color="-5776129"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=0" maxValue="=20" color="-2888193"/>
</AreaColor>
</ColorList>
</MapHotAreaColor>
</GaugeDetailStyle>
<gaugeAxis>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange maxValue="=9020"/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
<VanChartGaugeAxisAttr mainTickColor="-4539718" secTickColor="-1907998"/>
</gaugeAxis>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<MeterTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[去年回款同比分析]]></Name>
</TableData>
<MeterTable201109 meterType="1" name="年份" value="去年同期计划回款额"/>
</MeterTableDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="250" height="150"/>
</Widget>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart7"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.gauge.VanChartGaugePlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="false" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="88" foreground="-14374913"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
<gaugeValueLabel class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-16724737"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</gaugeValueLabel>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-15118441"/>
<OColor colvalue="-11184811"/>
<OColor colvalue="-16711936"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartGaugePlotAttr gaugeStyle="ring"/>
<GaugeDetailStyle>
<GaugeDetailStyleAttr horizontalLayout="true" paneBackgroundColor="-13408513" innerPaneBackgroundColor="-723724" antiClockWise="true"/>
<MapHotAreaColor>
<MC_Attr minValue="0.0" maxValue="100.0" useType="0" areaNumber="5" mainColor="-14374913"/>
<ColorList>
<AreaColor>
<AC_Attr minValue="=80" maxValue="=100" color="-14374913"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=60" maxValue="=80" color="-11486721"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=40" maxValue="=60" color="-8598785"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=20" maxValue="=40" color="-5776129"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=0" maxValue="=20" color="-2888193"/>
</AreaColor>
</ColorList>
</MapHotAreaColor>
</GaugeDetailStyle>
<gaugeAxis>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange maxValue="=8000"/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
<VanChartGaugeAxisAttr mainTickColor="-4539718" secTickColor="-1907998"/>
</gaugeAxis>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<MeterTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[去年回款同比分析]]></Name>
</TableData>
<MeterTable201109 meterType="1" name="年份" value="去年同期计划回款额"/>
</MeterTableDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</body>
</InnerWidget>
<BoundsAttr x="139" y="36" width="88" height="87"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="chart8_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart8_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.gauge.VanChartGaugePlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="false" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="80" foreground="-16719744"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
<gaugeValueLabel class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="64" foreground="-1"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</gaugeValueLabel>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-15118441"/>
<OColor colvalue="-11184811"/>
<OColor colvalue="-16719744"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartGaugePlotAttr gaugeStyle="slot"/>
<GaugeDetailStyle>
<GaugeDetailStyleAttr horizontalLayout="true" needleColor="-1" slotBackgroundColor="-14374913" antiClockWise="true"/>
<MapHotAreaColor>
<MC_Attr minValue="0.0" maxValue="100.0" useType="0" areaNumber="5" mainColor="-14374913"/>
<ColorList>
<AreaColor>
<AC_Attr minValue="=80" maxValue="=100" color="-14374913"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=60" maxValue="=80" color="-11486721"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=40" maxValue="=60" color="-8598785"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=20" maxValue="=40" color="-5776129"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=0" maxValue="=20" color="-2888193"/>
</AreaColor>
</ColorList>
</MapHotAreaColor>
</GaugeDetailStyle>
<gaugeAxis>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange maxValue="=8700"/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
<VanChartGaugeAxisAttr mainTickColor="-4539718" secTickColor="-1907998"/>
</gaugeAxis>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<MeterTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[去年回款同比分析]]></Name>
</TableData>
<MeterTable201109 meterType="1" name="年份" value="去年同期计划回款额"/>
</MeterTableDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="250" height="150"/>
</Widget>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart8"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.gauge.VanChartGaugePlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="false" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="88" foreground="-16724737"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
<gaugeValueLabel class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-14374913"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</gaugeValueLabel>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-15118441"/>
<OColor colvalue="-11184811"/>
<OColor colvalue="-16711936"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartGaugePlotAttr gaugeStyle="ring"/>
<GaugeDetailStyle>
<GaugeDetailStyleAttr horizontalLayout="true" paneBackgroundColor="-14374913" innerPaneBackgroundColor="-723724" antiClockWise="true"/>
<MapHotAreaColor>
<MC_Attr minValue="0.0" maxValue="100.0" useType="0" areaNumber="5" mainColor="-14374913"/>
<ColorList>
<AreaColor>
<AC_Attr minValue="=80" maxValue="=100" color="-14374913"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=60" maxValue="=80" color="-11486721"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=40" maxValue="=60" color="-8598785"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=20" maxValue="=40" color="-5776129"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=0" maxValue="=20" color="-2888193"/>
</AreaColor>
</ColorList>
</MapHotAreaColor>
</GaugeDetailStyle>
<gaugeAxis>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange maxValue="=7800"/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
<VanChartGaugeAxisAttr mainTickColor="-4539718" secTickColor="-1907998"/>
</gaugeAxis>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<MeterTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[去年回款同比分析]]></Name>
</TableData>
<MeterTable201109 meterType="1" name="年份" value="去年同期计划回款额"/>
</MeterTableDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</body>
</InnerWidget>
<BoundsAttr x="136" y="115" width="88" height="87"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="chart0_c_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart0_c_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.gauge.VanChartGaugePlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="false" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="80" foreground="-16719744"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
<gaugeValueLabel class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="64" foreground="-1"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</gaugeValueLabel>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-15118441"/>
<OColor colvalue="-11184811"/>
<OColor colvalue="-16719744"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartGaugePlotAttr gaugeStyle="slot"/>
<GaugeDetailStyle>
<GaugeDetailStyleAttr horizontalLayout="true" needleColor="-1" slotBackgroundColor="-14374913" antiClockWise="true"/>
<MapHotAreaColor>
<MC_Attr minValue="0.0" maxValue="100.0" useType="0" areaNumber="5" mainColor="-14374913"/>
<ColorList>
<AreaColor>
<AC_Attr minValue="=80" maxValue="=100" color="-14374913"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=60" maxValue="=80" color="-11486721"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=40" maxValue="=60" color="-8598785"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=20" maxValue="=40" color="-5776129"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=0" maxValue="=20" color="-2888193"/>
</AreaColor>
</ColorList>
</MapHotAreaColor>
</GaugeDetailStyle>
<gaugeAxis>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange maxValue="=8300"/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
<VanChartGaugeAxisAttr mainTickColor="-4539718" secTickColor="-1907998"/>
</gaugeAxis>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<MeterTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[去年回款同比分析]]></Name>
</TableData>
<MeterTable201109 meterType="1" name="年份" value="去年同期计划回款额"/>
</MeterTableDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="250" height="150"/>
</Widget>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.gauge.VanChartGaugePlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="false" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="88" foreground="-14374913"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
<gaugeValueLabel class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-16724737"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</gaugeValueLabel>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName="新特性"/>
<isCustomFillStyle isCustomFillStyle="false"/>
<ColorList>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartGaugePlotAttr gaugeStyle="ring"/>
<GaugeDetailStyle>
<GaugeDetailStyleAttr horizontalLayout="true" paneBackgroundColor="-1118482" innerPaneBackgroundColor="-723724" antiClockWise="true"/>
<MapHotAreaColor>
<MC_Attr minValue="0.0" maxValue="100.0" useType="0" areaNumber="5" mainColor="-14374913"/>
</MapHotAreaColor>
</GaugeDetailStyle>
<gaugeAxis>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="verdana" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
<VanChartGaugeAxisAttr mainTickColor="-4539718" secTickColor="-1907998"/>
</gaugeAxis>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<MeterTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[去年回款同比分析]]></Name>
</TableData>
<MeterTable201109 meterType="1" name="年份" value="去年同期计划回款额"/>
</MeterTableDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</body>
</InnerWidget>
<BoundsAttr x="728" y="35" width="88" height="87"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="chart7_c_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart7_c_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.gauge.VanChartGaugePlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="false" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="80" foreground="-16719744"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
<gaugeValueLabel class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="64" foreground="-1"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</gaugeValueLabel>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-15118441"/>
<OColor colvalue="-11184811"/>
<OColor colvalue="-16719744"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartGaugePlotAttr gaugeStyle="slot"/>
<GaugeDetailStyle>
<GaugeDetailStyleAttr horizontalLayout="true" needleColor="-1" slotBackgroundColor="-14374913" antiClockWise="true"/>
<MapHotAreaColor>
<MC_Attr minValue="0.0" maxValue="100.0" useType="0" areaNumber="5" mainColor="-14374913"/>
<ColorList>
<AreaColor>
<AC_Attr minValue="=80" maxValue="=100" color="-14374913"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=60" maxValue="=80" color="-11486721"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=40" maxValue="=60" color="-8598785"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=20" maxValue="=40" color="-5776129"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=0" maxValue="=20" color="-2888193"/>
</AreaColor>
</ColorList>
</MapHotAreaColor>
</GaugeDetailStyle>
<gaugeAxis>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange maxValue="=10000"/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
<VanChartGaugeAxisAttr mainTickColor="-4539718" secTickColor="-1907998"/>
</gaugeAxis>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<MeterTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[去年回款同比分析]]></Name>
</TableData>
<MeterTable201109 meterType="1" name="年份" value="去年同期计划回款额"/>
</MeterTableDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="250" height="150"/>
</Widget>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart7"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.gauge.VanChartGaugePlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="false" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="88" foreground="-14374913"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
<gaugeValueLabel class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-16724737"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</gaugeValueLabel>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName="新特性"/>
<isCustomFillStyle isCustomFillStyle="false"/>
<ColorList>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartGaugePlotAttr gaugeStyle="ring"/>
<GaugeDetailStyle>
<GaugeDetailStyleAttr horizontalLayout="true" paneBackgroundColor="-1118482" innerPaneBackgroundColor="-723724" antiClockWise="true"/>
<MapHotAreaColor>
<MC_Attr minValue="0.0" maxValue="100.0" useType="0" areaNumber="5" mainColor="-14374913"/>
</MapHotAreaColor>
</GaugeDetailStyle>
<gaugeAxis>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="verdana" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
<VanChartGaugeAxisAttr mainTickColor="-4539718" secTickColor="-1907998"/>
</gaugeAxis>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<MeterTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[去年回款同比分析]]></Name>
</TableData>
<MeterTable201109 meterType="1" name="年份" value="去年同期计划回款额"/>
</MeterTableDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</body>
</InnerWidget>
<BoundsAttr x="772" y="35" width="83" height="88"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="chart5_c_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart5_c_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.gauge.VanChartGaugePlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="false" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="80" foreground="-16719744"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
<gaugeValueLabel class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="64" foreground="-1"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</gaugeValueLabel>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-15118441"/>
<OColor colvalue="-11184811"/>
<OColor colvalue="-16719744"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartGaugePlotAttr gaugeStyle="slot"/>
<GaugeDetailStyle>
<GaugeDetailStyleAttr horizontalLayout="true" needleColor="-1" slotBackgroundColor="-14374913" antiClockWise="true"/>
<MapHotAreaColor>
<MC_Attr minValue="0.0" maxValue="100.0" useType="0" areaNumber="5" mainColor="-14374913"/>
<ColorList>
<AreaColor>
<AC_Attr minValue="=80" maxValue="=100" color="-14374913"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=60" maxValue="=80" color="-11486721"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=40" maxValue="=60" color="-8598785"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=20" maxValue="=40" color="-5776129"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=0" maxValue="=20" color="-2888193"/>
</AreaColor>
</ColorList>
</MapHotAreaColor>
</GaugeDetailStyle>
<gaugeAxis>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange maxValue="=9100"/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
<VanChartGaugeAxisAttr mainTickColor="-4539718" secTickColor="-1907998"/>
</gaugeAxis>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<MeterTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[去年回款同比分析]]></Name>
</TableData>
<MeterTable201109 meterType="1" name="年份" value="去年同期计划回款额"/>
</MeterTableDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="250" height="150"/>
</Widget>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart5"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.gauge.VanChartGaugePlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="false" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="88" foreground="-16724737"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
<gaugeValueLabel class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-14374913"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</gaugeValueLabel>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName="新特性"/>
<isCustomFillStyle isCustomFillStyle="false"/>
<ColorList>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartGaugePlotAttr gaugeStyle="ring"/>
<GaugeDetailStyle>
<GaugeDetailStyleAttr horizontalLayout="true" paneBackgroundColor="-1118482" innerPaneBackgroundColor="-723724" antiClockWise="true"/>
<MapHotAreaColor>
<MC_Attr minValue="0.0" maxValue="100.0" useType="0" areaNumber="5" mainColor="-14374913"/>
</MapHotAreaColor>
</GaugeDetailStyle>
<gaugeAxis>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="verdana" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
<VanChartGaugeAxisAttr mainTickColor="-4539718" secTickColor="-1907998"/>
</gaugeAxis>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<MeterTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[去年回款同比分析]]></Name>
</TableData>
<MeterTable201109 meterType="1" name="年份" value="去年同期计划回款额"/>
</MeterTableDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</body>
</InnerWidget>
<BoundsAttr x="728" y="114" width="88" height="87"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="chart8_c_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart8_c_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.gauge.VanChartGaugePlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="false" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="80" foreground="-16719744"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
<gaugeValueLabel class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="64" foreground="-1"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</gaugeValueLabel>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-15118441"/>
<OColor colvalue="-11184811"/>
<OColor colvalue="-16719744"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartGaugePlotAttr gaugeStyle="slot"/>
<GaugeDetailStyle>
<GaugeDetailStyleAttr horizontalLayout="true" needleColor="-1" slotBackgroundColor="-14374913" antiClockWise="true"/>
<MapHotAreaColor>
<MC_Attr minValue="0.0" maxValue="100.0" useType="0" areaNumber="5" mainColor="-14374913"/>
<ColorList>
<AreaColor>
<AC_Attr minValue="=80" maxValue="=100" color="-14374913"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=60" maxValue="=80" color="-11486721"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=40" maxValue="=60" color="-8598785"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=20" maxValue="=40" color="-5776129"/>
</AreaColor>
<AreaColor>
<AC_Attr minValue="=0" maxValue="=20" color="-2888193"/>
</AreaColor>
</ColorList>
</MapHotAreaColor>
</GaugeDetailStyle>
<gaugeAxis>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange maxValue="=8800"/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
<VanChartGaugeAxisAttr mainTickColor="-4539718" secTickColor="-1907998"/>
</gaugeAxis>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<MeterTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[去年回款同比分析]]></Name>
</TableData>
<MeterTable201109 meterType="1" name="年份" value="去年同期计划回款额"/>
</MeterTableDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="250" height="150"/>
</Widget>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart8"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.gauge.VanChartGaugePlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="false" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="true"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="1" size="88" foreground="-16724737"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
<gaugeValueLabel class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-14374913"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</gaugeValueLabel>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName="新特性"/>
<isCustomFillStyle isCustomFillStyle="false"/>
<ColorList>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartGaugePlotAttr gaugeStyle="ring"/>
<GaugeDetailStyle>
<GaugeDetailStyleAttr horizontalLayout="true" paneBackgroundColor="-1118482" innerPaneBackgroundColor="-723724" antiClockWise="true"/>
<MapHotAreaColor>
<MC_Attr minValue="0.0" maxValue="100.0" useType="0" areaNumber="5" mainColor="-14374913"/>
</MapHotAreaColor>
</GaugeDetailStyle>
<gaugeAxis>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="verdana" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
<VanChartGaugeAxisAttr mainTickColor="-4539718" secTickColor="-1907998"/>
</gaugeAxis>
<VanChartRadius radiusType="auto" radius="100"/>
</Plot>
<ChartDefinition>
<MeterTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[去年回款同比分析]]></Name>
</TableData>
<MeterTable201109 meterType="1" name="年份" value="去年同期计划回款额"/>
</MeterTableDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</body>
</InnerWidget>
<BoundsAttr x="772" y="114" width="83" height="87"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="chart6_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart6_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.funnel.VanChartFunnelPlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.chart.base.AttrBorder">
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.chart.base.AttrAlpha">
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="88" foreground="-1"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="true"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipNameFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-13421773"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="false"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="true" autoAdjust="false" position="6" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipNameFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="false"/>
<FRFont name="微软雅黑" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName="新特性"/>
<isCustomFillStyle isCustomFillStyle="false"/>
<ColorList>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartFunnelPlotAttr useSameSlantAngle="false" sort="false"/>
</Plot>
<ChartDefinition>
<OneValueCDDefinition seriesName="任职级别" valueName="记录数" function="com.fr.data.util.function.NoneFunction">
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[级别分布]]></Name>
</TableData>
</OneValueCDDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="true" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="88"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipNameFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="250" height="150"/>
</Widget>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart6"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.funnel.VanChartFunnelPlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.chart.base.AttrBorder">
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.chart.base.AttrAlpha">
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="false"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="true" autoAdjust="false" position="6" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipNameFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipNameFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="false"/>
<FRFont name="微软雅黑" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName="新特性"/>
<isCustomFillStyle isCustomFillStyle="false"/>
<ColorList>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartFunnelPlotAttr useSameSlantAngle="true" sort="true"/>
</Plot>
</Chart>
<tools hidden="true" sort="false" export="true" fullScreen="true"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipNameFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</body>
</InnerWidget>
<BoundsAttr x="418" y="374" width="136" height="146"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="chart9_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart9_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.custom.VanChartCustomPlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="false"/>
<FRFont name="微软雅黑" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName="新特性"/>
<isCustomFillStyle isCustomFillStyle="false"/>
<ColorList>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartRectanglePlotAttr vanChartPlotType="normal" isDefaultIntervalBackground="true"/>
<XAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="64" foreground="-1"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
</VanChartAxis>
</XAxisList>
<YAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-1"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="4"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-1"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴2" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
</YAxisList>
<stackAndAxisCondition>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
</stackAndAxisCondition>
<VanChartCustomPlotAttr customStyle="stack_column_line"/>
<CustomPlotList>
<VanChartPlot class="com.fr.plugin.chart.column.VanChartColumnPlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.chart.base.AttrBorder">
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.chart.base.AttrAlpha">
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
<ConditionAttrList>
<List index="0">
<ConditionAttr name="条件属性1">
<Condition class="com.fr.chart.chartattr.ChartCommonCondition">
<CNUMBER>
<![CDATA[2]]></CNUMBER>
<CNAME>
<![CDATA[SERIES_INDEX]]></CNAME>
<Compare op="0">
<O t="I">
<![CDATA[3]]></O>
</Compare>
</Condition>
</ConditionAttr>
</List>
</ConditionAttrList>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="true"/>
<FRFont name="Microsoft YaHei" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName="新特性"/>
<isCustomFillStyle isCustomFillStyle="false"/>
<ColorList>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartRectanglePlotAttr vanChartPlotType="custom" isDefaultIntervalBackground="true"/>
<XAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="64" foreground="-1"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
</VanChartAxis>
</XAxisList>
<YAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-1"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="4"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-1"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴2" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
</YAxisList>
<stackAndAxisCondition>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
<ConditionAttrList>
<List index="0">
<ConditionAttr name="堆积和坐标轴1">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrSeriesStackAndAxis">
<AttrSeriesStackAndAxis>
<Attr xAxisIndex="0" yAxisIndex="0" stacked="true" percentStacked="false" stackID="stackID"/>
</AttrSeriesStackAndAxis>
</Attr>
</AttrList>
<Condition class="com.fr.data.condition.ListCondition"/>
</ConditionAttr>
</List>
</ConditionAttrList>
</ConditionCollection>
</stackAndAxisCondition>
<VanChartColumnPlotAttr seriesOverlapPercent="20.0" categoryIntervalPercent="20.0" fixedWidth="false" columnWidth="0" filledWithImage="false" isBar="false"/>
</VanChartPlot>
<VanChartPlot class="com.fr.plugin.chart.line.VanChartLinePlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrMarker">
<VanAttrMarker>
<Attr isCommon="true" markerType="NullMarker" radius="4.5" width="30.0" height="30.0"/>
<Background name="NullBackground"/>
</VanAttrMarker>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrLine">
<VanAttrLine>
<Attr lineWidth="2" lineStyle="0" nullValueBreak="true"/>
</VanAttrLine>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="true"/>
<FRFont name="Microsoft YaHei" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName="新特性"/>
<isCustomFillStyle isCustomFillStyle="false"/>
<ColorList>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartRectanglePlotAttr vanChartPlotType="custom" isDefaultIntervalBackground="true"/>
<XAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="64" foreground="-1"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
</VanChartAxis>
</XAxisList>
<YAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-1"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="4"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-1"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴2" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
</YAxisList>
<stackAndAxisCondition>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
<ConditionAttrList>
<List index="0">
<ConditionAttr name="堆积和坐标轴1">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrSeriesStackAndAxis">
<AttrSeriesStackAndAxis>
<Attr xAxisIndex="0" yAxisIndex="1" stacked="false" percentStacked="false" stackID="stackID"/>
</AttrSeriesStackAndAxis>
</Attr>
</AttrList>
<Condition class="com.fr.data.condition.ListCondition"/>
</ConditionAttr>
</List>
</ConditionAttrList>
</ConditionCollection>
</stackAndAxisCondition>
</VanChartPlot>
</CustomPlotList>
</Plot>
<ChartDefinition>
<CustomDefinition>
<DefinitionMapList>
<DefinitionMap key="column">
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[柱型折线图]]></Name>
</TableData>
<CategoryName value="星期几"/>
<ChartSummaryColumn name="本周" function="com.fr.data.util.function.NoneFunction" customName="本周"/>
<ChartSummaryColumn name="上周" function="com.fr.data.util.function.NoneFunction" customName="上周"/>
</MoreNameCDDefinition>
</DefinitionMap>
<DefinitionMap key="line">
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[柱型折线图]]></Name>
</TableData>
<CategoryName value="星期几"/>
<ChartSummaryColumn name="本周" function="com.fr.data.util.function.NoneFunction" customName="本周"/>
<ChartSummaryColumn name="上周" function="com.fr.data.util.function.NoneFunction" customName="上周"/>
</MoreNameCDDefinition>
</DefinitionMap>
</DefinitionMapList>
</CustomDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="250" height="150"/>
</Widget>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart9"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1118482"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.custom.VanChartCustomPlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="false"/>
<FRFont name="微软雅黑" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName="新特性"/>
<isCustomFillStyle isCustomFillStyle="false"/>
<ColorList>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartRectanglePlotAttr vanChartPlotType="normal" isDefaultIntervalBackground="true"/>
<XAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
</VanChartAxis>
</XAxisList>
<YAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="4"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴2" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
</YAxisList>
<stackAndAxisCondition>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
</stackAndAxisCondition>
<VanChartCustomPlotAttr customStyle="stack_column_line"/>
<CustomPlotList>
<VanChartPlot class="com.fr.plugin.chart.column.VanChartColumnPlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.chart.base.AttrBorder">
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
</Attr>
<Attr class="com.fr.chart.base.AttrAlpha">
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
<ConditionAttrList>
<List index="0">
<ConditionAttr name="条件属性1">
<Condition class="com.fr.chart.chartattr.ChartCommonCondition">
<CNUMBER>
<![CDATA[2]]></CNUMBER>
<CNAME>
<![CDATA[SERIES_INDEX]]></CNAME>
<Compare op="0">
<O t="I">
<![CDATA[3]]></O>
</Compare>
</Condition>
</ConditionAttr>
</List>
</ConditionAttrList>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="true"/>
<FRFont name="Microsoft YaHei" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName="新特性"/>
<isCustomFillStyle isCustomFillStyle="false"/>
<ColorList>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartRectanglePlotAttr vanChartPlotType="custom" isDefaultIntervalBackground="true"/>
<XAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
</VanChartAxis>
</XAxisList>
<YAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="4"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴2" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
</YAxisList>
<stackAndAxisCondition>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
<ConditionAttrList>
<List index="0">
<ConditionAttr name="堆积和坐标轴1">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrSeriesStackAndAxis">
<AttrSeriesStackAndAxis>
<Attr xAxisIndex="0" yAxisIndex="0" stacked="true" percentStacked="false" stackID="stackID"/>
</AttrSeriesStackAndAxis>
</Attr>
</AttrList>
<Condition class="com.fr.data.condition.ListCondition"/>
</ConditionAttr>
</List>
</ConditionAttrList>
</ConditionCollection>
</stackAndAxisCondition>
<VanChartColumnPlotAttr seriesOverlapPercent="20.0" categoryIntervalPercent="20.0" fixedWidth="false" columnWidth="0" filledWithImage="false" isBar="false"/>
</VanChartPlot>
<VanChartPlot class="com.fr.plugin.chart.line.VanChartLinePlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrMarker">
<VanAttrMarker>
<Attr isCommon="true" markerType="NullMarker" radius="4.5" width="30.0" height="30.0"/>
<Background name="NullBackground"/>
</VanAttrMarker>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrLine">
<VanAttrLine>
<Attr lineWidth="2" lineStyle="0" nullValueBreak="true"/>
</VanAttrLine>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="true"/>
<FRFont name="Microsoft YaHei" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName="新特性"/>
<isCustomFillStyle isCustomFillStyle="false"/>
<ColorList>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
<OColor colvalue="-472193"/>
<OColor colvalue="-486008"/>
<OColor colvalue="-8595761"/>
<OColor colvalue="-7236949"/>
<OColor colvalue="-8873759"/>
<OColor colvalue="-1071514"/>
<OColor colvalue="-1188474"/>
<OColor colvalue="-6715442"/>
<OColor colvalue="-10243346"/>
<OColor colvalue="-8988015"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartRectanglePlotAttr vanChartPlotType="custom" isDefaultIntervalBackground="true"/>
<XAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="1" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="3"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="64" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="2" secTickLine="0" axisName="X轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
</VanChartAxis>
</XAxisList>
<YAxisList>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="2"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
<VanChartAxis class="com.fr.plugin.chart.attr.axis.VanChartValueAxis">
<Title>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[]]></O>
<TextAttr>
<Attr rotation="-90" alignText="0">
<FRFont name="Verdana" style="0" size="88" foreground="-10066330"/>
</Attr>
</TextAttr>
<TitleVisible value="true" position="0"/>
</Title>
<newAxisAttr isShowAxisLabel="true"/>
<AxisLineStyle AxisStyle="0" MainGridStyle="1"/>
<newLineColor lineColor="-5197648"/>
<AxisPosition value="4"/>
<TickLine201106 type="2" secType="0"/>
<ArrowShow arrowShow="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="微软雅黑" style="0" size="72" foreground="-10066330"/>
</Attr>
</TextAttr>
<AxisLabelCount value="=1"/>
<AxisRange/>
<AxisUnit201106 isCustomMainUnit="false" isCustomSecUnit="false" mainUnit="=0" secUnit="=0"/>
<ZoomAxisAttr isZoom="false"/>
<axisReversed axisReversed="false"/>
<VanChartAxisAttr mainTickLine="0" secTickLine="0" axisName="Y轴2" titleUseHtml="false" autoLabelGap="true" limitSize="false" maxHeight="15.0" commonValueFormat="true" isRotation="false"/>
<HtmlLabel customText="function(){ return this; }" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
<alertList/>
<customBackgroundList/>
<VanChartValueAxisAttr isLog="false" valueStyle="false" baseLog="=10"/>
<ds>
<RadarYAxisTableDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<attr/>
</RadarYAxisTableDefinition>
</ds>
</VanChartAxis>
</YAxisList>
<stackAndAxisCondition>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
<ConditionAttrList>
<List index="0">
<ConditionAttr name="堆积和坐标轴1">
<AttrList>
<Attr class="com.fr.plugin.chart.base.AttrSeriesStackAndAxis">
<AttrSeriesStackAndAxis>
<Attr xAxisIndex="0" yAxisIndex="1" stacked="false" percentStacked="false" stackID="stackID"/>
</AttrSeriesStackAndAxis>
</Attr>
</AttrList>
<Condition class="com.fr.data.condition.ListCondition"/>
</ConditionAttr>
</List>
</ConditionAttrList>
</ConditionCollection>
</stackAndAxisCondition>
</VanChartPlot>
</CustomPlotList>
</Plot>
<ChartDefinition>
<CustomDefinition>
<DefinitionMapList>
<DefinitionMap key="column">
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[柱型折线图]]></Name>
</TableData>
<CategoryName value="星期几"/>
<ChartSummaryColumn name="本周" function="com.fr.data.util.function.NoneFunction" customName="本周"/>
<ChartSummaryColumn name="上周" function="com.fr.data.util.function.NoneFunction" customName="上周"/>
</MoreNameCDDefinition>
</DefinitionMap>
<DefinitionMap key="line">
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[柱型折线图]]></Name>
</TableData>
<CategoryName value="星期几"/>
<ChartSummaryColumn name="本周" function="com.fr.data.util.function.NoneFunction" customName="本周"/>
<ChartSummaryColumn name="上周" function="com.fr.data.util.function.NoneFunction" customName="上周"/>
</MoreNameCDDefinition>
</DefinitionMap>
</DefinitionMapList>
</CustomDefinition>
</ChartDefinition>
</Chart>
<tools hidden="false" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="false" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="false" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipCategoryFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</body>
</InnerWidget>
<BoundsAttr x="233" y="385" width="179" height="135"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="chart0_c_c_c_c_c_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart0_c_c_c_c_c_c"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.75"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Microsoft YaHei" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.map.VanChartMapPlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.chart.base.AttrAlpha">
<AttrAlpha>
<Attr alpha="0.69"/>
</AttrAlpha>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrMarkerAlpha">
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrBorderWithAlpha">
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
<AlphaAttr alpha="1.0"/>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrEffect">
<AttrEffect>
<attr enabled="false" period="3.2"/>
</AttrEffect>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrMarker">
<VanAttrMarker>
<Attr isCommon="true" markerType="RoundFilledMarker" radius="4.0" width="30.0" height="30.0"/>
<Background name="NullBackground"/>
</VanAttrMarker>
</Attr>
<Attr class="com.fr.plugin.chart.map.line.condition.AttrCurve">
<AttrCurve>
<attr lineWidth="0.5" bending="30.0" alpha="100.0"/>
</AttrCurve>
</Attr>
<Attr class="com.fr.plugin.chart.map.line.condition.AttrLineEffect">
<AttrEffect>
<attr enabled="true" period="30.0"/>
<lineEffectAttr animationType="default"/>
<marker>
<VanAttrMarker>
<Attr isCommon="false" markerType="NullMarker" radius="4.5" width="30.0" height="30.0"/>
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="2"/>
</VanAttrMarker>
</marker>
</AttrEffect>
</Attr>
<Attr class="com.fr.plugin.chart.map.attr.AttrMapLabel">
<AttrMapLabel>
<areaLabel class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="false"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipMapValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="false"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</areaLabel>
<pointLabel class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="false"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipMapValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</pointLabel>
</AttrMapLabel>
</Attr>
<Attr class="com.fr.plugin.chart.map.attr.AttrMapTooltip">
<AttrMapTooltip>
<areaTooltip class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="true"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipMapValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</areaTooltip>
<pointTooltip class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipMapValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</pointTooltip>
<lineTooltip class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="false" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipStartAndEndNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</lineTooltip>
</AttrMapTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="false"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipMapValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="false"/>
<FRFont name="微软雅黑" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
<Attr4VanChartScatter>
<Type rangeLegendType="1"/>
<GradualLegend>
<GradualIntervalConfig>
<IntervalConfigAttr subColor="-14374913" divStage="2.0"/>
<ValueRange IsCustomMin="false" IsCustomMax="false"/>
<ColorDistList>
<ColorDist color="-4791553" dist="0.0"/>
<ColorDist color="-9583361" dist="0.5"/>
<ColorDist color="-14374913" dist="1.0"/>
</ColorDistList>
</GradualIntervalConfig>
<LegendLabelFormat>
<IsCommon commonValueFormat="true"/>
</LegendLabelFormat>
</GradualLegend>
</Attr4VanChartScatter>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-15118441"/>
<OColor colvalue="-11184811"/>
<OColor colvalue="-4363512"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartMapPlotAttr mapType="custom" geourl="assets/map/geographic/world/中国.json" zoomlevel="3" mapmarkertype="1" nullvaluecolor="-3355444"/>
<lineMapDataProcessor>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
</lineMapDataProcessor>
<GisLayer>
<Attr gislayer="null" layerName="无"/>
</GisLayer>
<ViewCenter auto="false" longitude="104.0" latitude="39.0"/>
<pointConditionCollection>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
</pointConditionCollection>
<lineConditionCollection>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
</lineConditionCollection>
</Plot>
<ChartDefinition>
<VanMapDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<areaDefinition class="com.fr.plugin.chart.map.data.VanMapMoreNameCDDefinition">
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[ds9]]></Name>
</TableData>
<CategoryName value="省份"/>
<ChartSummaryColumn name="销售额" function="com.fr.data.util.function.NoneFunction" customName="销售额"/>
</MoreNameCDDefinition>
<attr longitude="" latitude="" endLongitude="" endLatitude="" useAreaName="true" endAreaName=""/>
</areaDefinition>
<pointDefinition class="com.fr.plugin.chart.map.data.VanMapMoreNameCDDefinition">
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[ds10]]></Name>
</TableData>
<CategoryName value="pid"/>
<ChartSummaryColumn name="销售额" function="com.fr.data.util.function.NoneFunction" customName="销售额"/>
</MoreNameCDDefinition>
<attr longitude="" latitude="" endLongitude="" endLatitude="" useAreaName="true" endAreaName=""/>
</pointDefinition>
<lineDefinition class="com.fr.plugin.chart.map.data.VanMapMoreNameCDDefinition">
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
</MoreNameCDDefinition>
<attr longitude="" latitude="" endLongitude="" endLatitude="" useAreaName="true" endAreaName=""/>
</lineDefinition>
</VanMapDefinition>
</ChartDefinition>
</Chart>
<tools hidden="true" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="true" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="250" height="150"/>
</Widget>
<body class="com.fr.form.ui.ChartEditor">
<WidgetName name="chart0"/>
<WidgetAttr description="">
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[新建标题]]></O>
<FRFont name="SimSun" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LayoutAttr selectedIndex="0"/>
<ChangeAttr enable="false" changeType="button" timeInterval="5" buttonColor="-8421505" carouselColor="-8421505" showArrow="true">
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
</ChangeAttr>
<Chart name="默认" chartClass="com.fr.plugin.chart.vanchart.VanChart">
<Chart class="com.fr.plugin.chart.vanchart.VanChart">
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<ChartAttr isJSDraw="true" isStyleGlobal="false"/>
<Title4VanChart>
<Title>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-6908266"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.75"/>
</AttrAlpha>
</GI>
<O>
<![CDATA[新建图表标题]]></O>
<TextAttr>
<Attr alignText="0">
<FRFont name="Microsoft YaHei" style="0" size="128" foreground="-13421773"/>
</Attr>
</TextAttr>
<TitleVisible value="false" position="0"/>
</Title>
<Attr4VanChart useHtml="false" floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0"/>
</Title4VanChart>
<Plot class="com.fr.plugin.chart.map.VanChartMapPlot">
<VanChartPlotVersion version="20170715"/>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="0"/>
<newColor/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isNullValueBreak="true" autoRefreshPerSecond="6" seriesDragEnable="false" plotStyle="4" combinedSize="50.0"/>
<newHotTooltipStyle>
<AttrContents>
<Attr showLine="false" position="1" isWhiteBackground="true" isShowMutiSeries="false" seriesLabel="${VALUE}"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##]]></Format>
<PercentFormat>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#0.##%]]></Format>
</PercentFormat>
</AttrContents>
</newHotTooltipStyle>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name="">
<AttrList>
<Attr class="com.fr.chart.base.AttrAlpha">
<AttrAlpha>
<Attr alpha="0.69"/>
</AttrAlpha>
</Attr>
<Attr class="com.fr.plugin.chart.map.attr.AttrMapLabel">
<AttrMapLabel>
<areaLabel class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="false"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipMapValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</areaLabel>
<pointLabel class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="false"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipMapValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</pointLabel>
</AttrMapLabel>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrMarkerAlpha">
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrBorderWithAlpha">
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-1"/>
</AttrBorder>
<AlphaAttr alpha="1.0"/>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrEffect">
<AttrEffect>
<attr enabled="false" period="3.2"/>
</AttrEffect>
</Attr>
<Attr class="com.fr.plugin.chart.base.VanChartAttrMarker">
<VanAttrMarker>
<Attr isCommon="true" markerType="RoundFilledMarker" radius="4.0" width="30.0" height="30.0"/>
<Background name="NullBackground"/>
</VanAttrMarker>
</Attr>
<Attr class="com.fr.plugin.chart.map.line.condition.AttrCurve">
<AttrCurve>
<attr lineWidth="0.5" bending="30.0" alpha="100.0"/>
</AttrCurve>
</Attr>
<Attr class="com.fr.plugin.chart.map.line.condition.AttrLineEffect">
<AttrEffect>
<attr enabled="true" period="30.0"/>
<lineEffectAttr animationType="default"/>
<marker>
<VanAttrMarker>
<Attr isCommon="false" markerType="NullMarker" radius="4.5" width="30.0" height="30.0"/>
<Background name="ImageBackground" specifiedImageWidth="-1.0" specifiedImageHeight="-1.0" layout="2"/>
</VanAttrMarker>
</marker>
</AttrEffect>
</Attr>
<Attr class="com.fr.plugin.chart.map.attr.AttrMapTooltip">
<AttrMapTooltip>
<areaTooltip class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipMapValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</areaTooltip>
<pointTooltip class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipMapValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</pointTooltip>
<lineTooltip class="com.fr.plugin.chart.base.AttrTooltip">
<AttrTooltip>
<Attr enable="false" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0">
<FRFont name="宋体" style="0" size="72"/>
</Attr>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipStartAndEndNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-16777216"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.5"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</lineTooltip>
</AttrMapTooltip>
</Attr>
<Attr class="com.fr.plugin.chart.base.AttrLabel">
<AttrLabel>
<labelAttr enable="false"/>
<labelDetail class="com.fr.plugin.chart.base.AttrLabelDetail">
<Attr showLine="false" autoAdjust="false" position="5" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipMapValueFormat">
<AttrTooltipValueFormat>
<Attr enable="false"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="false"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="false"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
</labelDetail>
</AttrLabel>
</Attr>
</AttrList>
</ConditionAttr>
</DefaultAttr>
</ConditionCollection>
<Legend4VanChart>
<Legend>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="true"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" isRoundBorder="false" roundRadius="2"/>
<newColor borderColor="-3355444"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr position="4" visible="false"/>
<FRFont name="微软雅黑" style="0" size="88" foreground="-10066330"/>
</Legend>
<Attr4VanChart floating="false" x="0.0" y="0.0" limitSize="false" maxHeight="15.0" isHighlight="true"/>
<Attr4VanChartScatter>
<Type rangeLegendType="1"/>
<GradualLegend>
<GradualIntervalConfig>
<IntervalConfigAttr subColor="-14374913" divStage="2.0"/>
<ValueRange IsCustomMin="false" IsCustomMax="false"/>
<ColorDistList>
<ColorDist color="-4791553" dist="0.0"/>
<ColorDist color="-9583361" dist="0.5"/>
<ColorDist color="-14374913" dist="1.0"/>
</ColorDistList>
</GradualIntervalConfig>
<LegendLabelFormat>
<IsCommon commonValueFormat="true"/>
</LegendLabelFormat>
</GradualLegend>
</Attr4VanChartScatter>
</Legend4VanChart>
<DataSheet>
<GI>
<AttrBackground>
<Background name="NullBackground"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="0"/>
<newColor borderColor="-16777216"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
<Attr isVisible="false"/>
</DataSheet>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
<newPlotFillStyle>
<AttrFillStyle>
<AFStyle colorStyle="1"/>
<FillStyleName fillStyleName=""/>
<isCustomFillStyle isCustomFillStyle="true"/>
<ColorList>
<OColor colvalue="-15118441"/>
<OColor colvalue="-11184811"/>
<OColor colvalue="-4363512"/>
<OColor colvalue="-16750485"/>
<OColor colvalue="-3658447"/>
<OColor colvalue="-10331231"/>
<OColor colvalue="-7763575"/>
<OColor colvalue="-6514688"/>
<OColor colvalue="-16744620"/>
<OColor colvalue="-6187579"/>
<OColor colvalue="-15714713"/>
<OColor colvalue="-945550"/>
<OColor colvalue="-4092928"/>
<OColor colvalue="-13224394"/>
<OColor colvalue="-12423245"/>
<OColor colvalue="-10043521"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-13031292"/>
<OColor colvalue="-16732559"/>
<OColor colvalue="-7099690"/>
<OColor colvalue="-11991199"/>
<OColor colvalue="-331445"/>
<OColor colvalue="-6991099"/>
<OColor colvalue="-16686527"/>
<OColor colvalue="-9205567"/>
<OColor colvalue="-7397856"/>
<OColor colvalue="-406154"/>
<OColor colvalue="-2712831"/>
<OColor colvalue="-4737097"/>
<OColor colvalue="-11460720"/>
<OColor colvalue="-6696775"/>
<OColor colvalue="-3685632"/>
</ColorList>
</AttrFillStyle>
</newPlotFillStyle>
<VanChartPlotAttr isAxisRotation="false" categoryNum="1"/>
<VanChartMapPlotAttr mapType="custom" geourl="assets/map/geographic/world/中国.json" zoomlevel="23" mapmarkertype="1" nullvaluecolor="-3355444"/>
<lineMapDataProcessor>
<DataProcessor class="com.fr.base.chart.chartdata.model.NormalDataModel"/>
</lineMapDataProcessor>
<GisLayer>
<Attr gislayer="null" layerName="无"/>
</GisLayer>
<ViewCenter auto="false" longitude="104.0" latitude="39.0"/>
<pointConditionCollection>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
</pointConditionCollection>
<lineConditionCollection>
<ConditionCollection>
<DefaultAttr class="com.fr.chart.chartglyph.ConditionAttr">
<ConditionAttr name=""/>
</DefaultAttr>
</ConditionCollection>
</lineConditionCollection>
</Plot>
<ChartDefinition>
<VanMapDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<areaDefinition class="com.fr.plugin.chart.map.data.VanMapMoreNameCDDefinition">
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[ds2]]></Name>
</TableData>
<CategoryName value="省份"/>
<ChartSummaryColumn name="销售额" function="com.fr.data.util.function.NoneFunction" customName="销售额"/>
</MoreNameCDDefinition>
<attr longitude="" latitude="" endLongitude="" endLatitude="" useAreaName="true" endAreaName=""/>
</areaDefinition>
<pointDefinition class="com.fr.plugin.chart.map.data.VanMapMoreNameCDDefinition">
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[ds1]]></Name>
</TableData>
<CategoryName value="pid"/>
<ChartSummaryColumn name="销售额" function="com.fr.data.util.function.NoneFunction" customName="销售额"/>
</MoreNameCDDefinition>
<attr longitude="" latitude="" endLongitude="" endLatitude="" useAreaName="true" endAreaName=""/>
</pointDefinition>
<lineDefinition class="com.fr.plugin.chart.map.data.VanMapMoreNameCDDefinition">
<MoreNameCDDefinition>
<Top topCate="-1" topValue="-1" isDiscardOtherCate="false" isDiscardOtherSeries="false" isDiscardNullCate="false" isDiscardNullSeries="false"/>
</MoreNameCDDefinition>
<attr longitude="" latitude="" endLongitude="" endLatitude="" useAreaName="true" endAreaName=""/>
</lineDefinition>
</VanMapDefinition>
</ChartDefinition>
</Chart>
<tools hidden="true" sort="false" export="false" fullScreen="false"/>
<VanChartZoom>
<zoomAttr zoomVisible="false" zoomGesture="true" zoomResize="true" zoomType="xy"/>
<from>
<![CDATA[]]></from>
<to>
<![CDATA[]]></to>
</VanChartZoom>
<refreshMoreLabel>
<attr moreLabel="true" autoTooltip="true"/>
<AttrTooltip>
<Attr enable="true" duration="4" followMouse="false" showMutiSeries="true" isCustom="false"/>
<TextAttr>
<Attr alignText="0"/>
</TextAttr>
<AttrToolTipContent>
<Attr isCommon="true"/>
<value class="com.fr.plugin.chart.base.format.AttrTooltipValueFormat">
<AttrTooltipValueFormat>
<Attr enable="true"/>
</AttrTooltipValueFormat>
</value>
<percent class="com.fr.plugin.chart.base.format.AttrTooltipPercentFormat">
<AttrTooltipPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipPercentFormat>
</percent>
<category class="com.fr.plugin.chart.base.format.AttrTooltipAreaNameFormat">
<AttrToolTipCategoryFormat>
<Attr enable="true"/>
</AttrToolTipCategoryFormat>
</category>
<series class="com.fr.plugin.chart.base.format.AttrTooltipSeriesFormat">
<AttrTooltipSeriesFormat>
<Attr enable="true"/>
</AttrTooltipSeriesFormat>
</series>
<changedPercent class="com.fr.plugin.chart.base.format.AttrTooltipChangedPercentFormat">
<AttrTooltipChangedPercentFormat>
<Attr enable="false"/>
<Format class="com.fr.base.CoreDecimalFormat">
<![CDATA[#.##%]]></Format>
</AttrTooltipChangedPercentFormat>
</changedPercent>
<changedValue class="com.fr.plugin.chart.base.format.AttrTooltipChangedValueFormat">
<AttrTooltipChangedValueFormat>
<Attr enable="true"/>
</AttrTooltipChangedValueFormat>
</changedValue>
<HtmlLabel customText="" useHtml="false" isCustomWidth="false" isCustomHeight="false" width="50" height="50"/>
</AttrToolTipContent>
<GI>
<AttrBackground>
<Background name="ColorBackground" color="-1"/>
<Attr shadow="false"/>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="1" isRoundBorder="false" roundRadius="4"/>
<newColor borderColor="-15395563"/>
</AttrBorder>
<AttrAlpha>
<Attr alpha="0.8"/>
</AttrAlpha>
</GI>
</AttrTooltip>
</refreshMoreLabel>
</Chart>
<ChartMobileAttrProvider zoomOut="0" zoomIn="2" allowFullScreen="true"/>
</body>
</InnerWidget>
<BoundsAttr x="210" y="42" width="455" height="322"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="label0_c"/>
<Widget widgetName="report10_c"/>
<Widget widgetName="report5_c"/>
<Widget widgetName="report4_c"/>
<Widget widgetName="chart0_c_c"/>
<Widget widgetName="chart7_c_c"/>
<Widget widgetName="chart0_c"/>
<Widget widgetName="chart7_c"/>
<Widget widgetName="chart0_c_c_c_c_c_c"/>
<Widget widgetName="chart4_c_c"/>
<Widget widgetName="chart4_c"/>
<Widget widgetName="chart5_c_c"/>
<Widget widgetName="chart8_c_c"/>
<Widget widgetName="chart5_c"/>
<Widget widgetName="chart8_c"/>
<Widget widgetName="report7_c"/>
<Widget widgetName="report8_c"/>
<Widget widgetName="chart1_c"/>
<Widget widgetName="chart2_c"/>
<Widget widgetName="report2_c"/>
<Widget widgetName="report1_c"/>
<Widget widgetName="report5_c_c"/>
<Widget widgetName="report4_c_c"/>
<Widget widgetName="chart6_c"/>
<Widget widgetName="chart9_c"/>
<Widget widgetName="chart3_c"/>
</MobileWidgetList>
<WidgetScalingAttr compState="0"/>
<DesignResolution absoluteResolutionScaleW="1366" absoluteResolutionScaleH="768"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="960" height="600"/>
</Widget>
<Sorted sorted="false"/>
<MobileWidgetList>
<Widget widgetName="absolute0"/>
</MobileWidgetList>
<WidgetZoomAttr compState="0"/>
<AppRelayout appRelayout="true"/>
<Size width="960" height="600"/>
<ResolutionScalingAttr percent="0.9"/>
<BodyLayoutType type="0"/>
</Center>
</Layout>
<DesignerVersion DesignerVersion="KAA"/>
<PreviewType PreviewType="5"/>
<WatermarkAttr class="com.fr.base.iofile.attr.WatermarkAttr">
<WatermarkAttr fontSize="20" color="-6710887" valid="false">
<Text>
<![CDATA[]]></Text>
</WatermarkAttr>
</WatermarkAttr>
<TemplateIdAttMark class="com.fr.base.iofile.attr.TemplateIdAttrMark">
<TemplateIdAttMark TemplateId="cb96965d-e36a-4a18-96d5-e504bcbe2b1e"/>
</TemplateIdAttMark>
</Form>
