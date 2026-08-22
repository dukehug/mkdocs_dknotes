
# Module - 2 AI  In. Software Development

2026-08-18 16:16

Tags: #ADET 

Author:  Duke Hsu

---

# Topic 

1. AI and Machine Learning 
2. AI in Software Development
3. AI Assisted Programming Tools
4. Prompt Engineering for Developers
5. Ethical and Responsible AI 



## 1.0 Artificial Intelligence

**Everyday AI**

- Siri
- Google Assistant


**Business AI**

- Customer service 
- Chatbots 
- Fraud detection
- Predictive analytics
- Face  recognition


**Development AI**

- Code generation
- Bug detection
- Automated testing documentation

### 1.1 What is Machine Learning 


**Supervised Learning**

- Label


### 1.2  AI vs Machine Learning 

Artificial Intelligence

- Can be rule-based or data-driven
- Broader concept of machines  mimicking human intelligence .




Machine Learning 

- Algorithms 
- Training 
- 


### 1.3  Generative AI

Text , Image , Video , Code 



## 2.0 Generative AI in Software Development 

- Faster Coding 
- Documentation
- Test Generation
- Bug Detection
- Code Explanation
- Learning Aid


## 3.0 Prompt Engineering 

 Provide a good instructions for the AI 

- Better Results 
- Less Rework 
- Control 
- Career Skill

**Techniques** 

- Be Specific
- Give Context
- Specify Format
- Use Role Prompting
- Iterate
- Provide Examples 


## 4.0  Ethical Issues in AI for Software Development 

- Bias in AI
- Over-Reliance



## 5.0 Responsible AI Practices for Developers

- Always Review AI output
- Protect Sensitive Data
- Check for Bias and Fairiness
- Give Credit and Be Transparent 
- Stay Updated on Policies
- Keep Learning 







##  LAB AI Frameworks and Tools in 2026

- PyTorch
- TensoFlow
- JAX
- Hugface Transformers
- ONNX

Compare it  / How to use it ?

![image.png](https://img.dukehsu.com/study_note/20260819131758018.webp)


### AI 框架/工具總覽表

|工具|工作方式（部署/執行模式）|典型用法|適合場景|工作邏輯（流程）|
|---|---|---|---|---|
|**PyTorch**|動態計算圖（Eager Execution），程式執行到哪、圖就建到哪，方便除錯|研究、模型設計、訓練、生成式AI開發|需要快速實驗、調整模型架構、做研究的場合；目前多數LLM研究都用它|準備資料集 → 定義模型 → 訓練(反覆實驗) → 評估模型 → 根據結果再迭代|
|**TensorFlow**|靜態圖 + Keras 3 高階API，強調可攜性與正式環境部署|訓練模型後導入生產環境(伺服器、行動裝置、瀏覽器)|公司要把模型長期穩定運行在正式產品中，需要跨平台部署(TF Serving、瀏覽器用TF.js、行動裝置用LiteRT)|資料輸入 → 訓練與驗證 → 存成Saved Model → 部署到伺服器/裝置 → 持續監控、優化、重新訓練|
|**JAX**|函數式程式設計 + XLA 編譯加速，強調自動微分與可組合的運算|高效能數值運算、大規模模型研究、需要極致運算效能的場合|需要在TPU/GPU上跑大規模、高速的數學運算或研究型大模型|定義函數 f(x) → 自動計算梯度 ∇f(x) → 用JIT編譯成機器碼(XLA) → 在TPU/GPU叢集上大規模執行|
|**Hugging Face Transformers**|提供統一介面呼叫上千個預訓練模型，不用從零訓練|直接使用或微調現成的NLP/LLM/電腦視覺/多模態模型|開發者想用現成的Llama、GPT類模型，而不是自己從零訓練一個|選擇模型(GPT/Llama/Mistral等) → 載入對應的Tokenizer處理輸入 → 微調或直接使用模型 → 部署做推論 → 持續改進迭代|
|**ONNX**|定義一種「框架中立」的模型交換格式，把模型轉成通用格式後可在不同執行環境跑|把某框架訓練好的模型轉換成可跨平台部署的通用格式|公司用A框架訓練，卻要在B平台(如手機、邊緣裝置、不同雲端)上運行時|用任一框架訓練模型 → 匯出成ONNX格式 → 用ONNX Runtime做優化 → 部署到雲端/邊緣裝置/行動裝置等任何平台|
|**vLLM**|高吞吐量的LLM推論引擎，核心技術是PagedAttention高效管理記憶體|大規模同時服務多個使用者的LLM推論請求|公司需要讓很多使用者同時跟一個LLM對話、且要求低延遲高併發時|載入模型 → 用PagedAttention優化記憶體使用 → 透過相容OpenAI的API對外提供服務 → 多工作節點做水平擴展|

**一句話總結對照（可以直接用在第13題的論證邏輯裡）：**

- PyTorch → 研究與靈活實驗
- TensorFlow → 正式環境訓練與部署
- JAX → 高效能研究運算
- Hugging Face → 預訓練模型與多模態應用
- ONNX → 跨框架/跨平台模型互通
- vLLM → 大規模LLM推論服務



----
## References
