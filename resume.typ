#import "template.typ": *

// 设置图标, 来源: https://fontawesome.com/icons/
// 如果要修改图标颜色, 请手动修改 svg 文件中的 fill="rgb(38, 38, 125)" 属性
// 例如可以使用 VS Code 的全局文本替换功能
#let faAward = icon("icons/fa-award.svg")
#let faBuildingColumns = icon("icons/fa-building-columns.svg")
#let faCode = icon("icons/fa-code.svg")
#let faEnvelope = icon("icons/fa-envelope.svg")
#let faGithub = icon("icons/fa-github.svg")
#let faGraduationCap = icon("icons/fa-graduation-cap.svg")
#let faLinux = icon("icons/fa-linux.svg")
#let faPhone = icon("icons/fa-phone.svg")
#let faWindows = icon("icons/fa-windows.svg")
#let faWrench = icon("icons/fa-wrench.svg")
#let faWork = icon("icons/fa-work.svg")
#let faPencil = icon("icons/fa-pencil.svg")

// 主题颜色
#let themeColor = rgb(38, 38, 125)

// 设置简历选项与头部
#show: resume.with(
  // 字体基准大小
  size: 10pt,
  // 标题颜色
  themeColor: themeColor,
  // 控制纸张的边距
  top: 1.5cm,
  bottom: 2cm,
  left: 2cm,
  right: 2cm,

  // 如果需要姓名及联系信息居中，请删除下面关于头像的三行参数，并取消headerCenter的注释
  headerCenter : true,
  
  // 如果不需要头像，则将下面三行的参数注释或删除
  // photograph: "profile.jpg",
  // photographWidth: 10em,
  // gutterWidth: 2em,
)[

= 黎清兵

#info(
  color: themeColor,
  (
    // 其实 icon 也可以直接填字符串, 如 "fa-phone.svg" 
    icon: faPhone,
    content: "(+86) 19026948530"
  ),
  (
    icon: faBuildingColumns,
    content: "南开大学",
  ),
  (
    icon: faGraduationCap,
    content: "计算机技术",
  ),
  (
    icon: faEnvelope,
    content: "3263109808@qq.com",
    link: "mailto:3263109808@qq.com"
  ),
  (
    icon: faGithub,
    content: "github.com/lqb856",
    link: "https://github.com/lqb856",
  ),
)
][
// #h(2em)  // 手动顶行, 2em 代表两个字的宽度

// 我是 OrangeX4，你也可以叫我 *一只方橙* 或 *方橙*。现在是南京大学人工智能学院 2020 级本科生，正深陷于学习数学、编程和英语的无边苦海中。你问为什么我的名字那么奇怪？ 大概是我喜欢吃橘子和橙子，又谐音方程，还有和我的名字谐音的缘故吧。喜欢一切新奇的东西，兴趣十分广泛。
]


== #faGraduationCap 教育背景

// #sidebar(withLine: true, sideWidth: 15%)[
//   2023.09 - 2026.06
//   #v(2em)
//   2019.09 - 2023.06
// ][
//   *南开大学* ·  计算机技术（保研）研究方向：索引、学习型索引、向量检索

//   *中国地质大学（武汉）* · 软件工程（前 10%）
// ]

#resume_item(
  "南开大学 · 计算机学院（保研）",
  "硕士 | 计算机技术（前10%）",
  "研究方向：索引、学习型索引、向量检索",
  "2023.09 -- 2026.06"
)

#resume_item(
  "中国地质大学（武汉） · 软件工程学院",
  "本科 | 软件工程（前10%）",
  "主修课程：C++、数据结构、软件工程",
  "2019.09 -- 2023.06"
)

== #faCode 项目经历

#projectItem(
  link(
    "https://github.com/lqb856/Pim-ANNS",
    [ *PIM-ANNS: PIM 与 CPU 协同的 ANNS 系统（进行中）* ]
  ),
  [ *科研项目* ],
)

针对PIM架构现有对称量化方案导致的召回率衰减问题，设计非对称残差量化策略，在UPMEM PIM处理器上实现基于IVFPQ的层次化候选筛选：通过引入抽样+量化机制，在粗检索阶段保留高阶特征相似性；使用 Lookup Table的方式进行距离计算，减小PIM端的计算负载；CPU端构建可导航小世界图（NSG）进行多跳近邻校正，结合动态量化位宽分配策略，在PIM计算单元受限条件下实现精度-效率协同优化。

#projectItem(link(
    "https://github.com/lqb856/rtm-bench-private",
    [ *基于Intel事务内存的学习型索引优化 (2023.11 - 2024.2)* ]
  )
  ,
  [ *科研项目* ],
)

针对学习型索引LIPP+在高并发场景下空间占用过高的问题，设计并实现了基于Intel硬件事务内存（RTM）的优化方案LIPP-RTM。通过将项级锁优化为节点级锁，结合RTM技术实现细粒度并发控制，显著降低内存占用（实验显示空间减少24%以上）。提出无锁遍历、版本号同步机制及事务区域最小化策略，在保持查询性能的同时提升并发吞吐量。修复了原LIPP+的元数据同步缺陷，优化了数据收集算法。实验验证中，在lognormal、planet和fb数据集上，LIPP-RTM的更新密集型负载性能较节点级锁版本提升最高达128.5%，混合负载下性能接近项级锁方案。

#projectItem(link(
    "https://github.com/lqb856/minidocker",
    [ *MiniDocker 轻量级容器引擎 (2024.10 - 2024.11)* ]
  ),
  [ *个人项目* ],
)

基于Go语言实现容器运行时系统，完整复现进程隔离、资源管控等核心功能：通过Linux namespace实现PID/UTS/NS隔离，利用cgroups v2进行CPU/内存配额控制；使用联合文件系统实现镜像分层与数据卷挂载，构建veth pair+网桥实现容器网络虚拟化；开发CLI管理工具链，支持容器生命周期管理、日志采集及端口映射等操作。

// #projectItem(
//   [ *Others* ]
//   ,
//   [ *个人项目* ],
// )
// CMU15445、MIT6.824、MIT6.S081、LightGNN、MiniTorch 等公开课项目或个人项目。

== #faPencil 竞赛经历

#projectItem(link(
    "https://github.com/lqb856/miniob_private",
    [ *OceanBeacon数据库大赛 (2023.09 - 2023.12)* ]
  ),
  [ *天津市第一名* ],
)

作为队长参与第三届OceanBase数据库大赛，负责SQL层核心模块开发，完成查询解析器、逻辑/物理查询计划生成及优化器实现。通过构建表达式解析引擎支持嵌套子查询与复杂函数，设计分桶统计策略优化聚合运算性能。项目实现24项关键赛题功能，以天津市第一名晋级决赛。


#projectItem(link(
    "https://github.com/lqb856/miniob_private",
    [ *亚太区RDMA编程竞赛 (2023.08 - 2023.9)* ]
  ),
  [ *亚太区第二名* ],
)

作为队长参与第十一届亚太区RDMA编程竞赛，成功在 UCC 统一集合通讯库中添加了基于 Sharp 可编程交换机的 Reduce Scatter 算子并进行了相关优化。在超算集群中使用16个节点进行测试，优化后的版本比初始版本平均提升10倍左右。完赛后整理了相关代码并向 UCC 库提交了 pull request。最终获得亚太区域二等奖。


== #faAward 获奖情况

*南开大学 2024 年研究生专项奖学金（竞赛方向）*、*2020年地大英才奖学金*

== #faWrench 专业技能

#sidebar(withLine: false, sideWidth: 6%)[
  
  *>英语*
  
  *>熟悉*

  *>了解*
][
  CET6（557分），CET4（649分）日常可以流利沟通，擅长英文写作
  
  C++, Python, Git
  
  Java, GO, Docker, CMake, Shell
]

