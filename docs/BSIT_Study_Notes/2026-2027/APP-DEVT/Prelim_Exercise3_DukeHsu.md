
# LAB - Prelim  Exercise 3   AI Frameworks & Tools Comparison

2026-08-19 16:36

Tags:  #ADET 

Author:  Duke Hsu

---

# Lab Exercise 3

## Hands-on Activity: Exploring AI Tools in Software Development


![AI_TOOLS_2026](https://img.dukehsu.com/study_note/20260819131758018.webp)



## Guide Questions / Lab Questions

### Part A – Framework Investigation

1. What is the primary purpose of **PyTorch**, and why is it widely used for AI research and Generative AI?

	PyTorch's primary purpose is to provide a flexible, open-source deep learning framework built around ==dynamic computation graphs and eager execution== — meaning the graph is built on the fly as code runs, rather than being defined upfront. This is why it is widely used for AI research and Generative AI: ==researchers can debug and modify model architectures interactively during development==, which greatly speeds up experimentation. Combined with its strong ecosystem (TorchVision, TorchAudio, Hugging Face integration), PyTorch supports a fast iterative workflow — dataset preparation, model definition, training, evaluation, and refinement — making it ideal for research settings where flexibility and rapid iteration matter most.


2. How does **TensorFlow** differ from **PyTorch** in terms of production deployment and ecosystem?

	In production deployment, ==TensorFlow uses a static computation graph==, meaning the model's structure is fixed before deployment. This makes it easier to optimize, package, and deploy across devices through tools like TF Serving, LiteRT, and TF.js. PyTorch, on the other hand, uses eager execution and dynamic graphs, which allows developers to modify and debug models on the fly — making it more suited for research and experimentation, especially when integrated with TorchVision, TorchAudio, and Hugging Face.
	
	In terms of ecosystem, TensorFlow's ecosystem is centered around production deployment (TF Serving for servers, LiteRT for mobile/edge devices, TF.js for browsers), while PyTorch's ecosystem is centered around research and model development (TorchVision, TorchAudio, Hugging Face integration).
	
	Overall, PyTorch is stronger in the research and development stage where flexibility matters most, while TensorFlow is stronger in the deployment stage where stability and cross-platform delivery matter most.

3. What makes **JAX** suitable for high-performance numerical computing and large-scale AI research?
    
    JAX is suitable for high-performance numerical computing and large-scale AI research mainly because of its functional programming design combined with JIT compilation. Unlike frameworks that are tied to fixed neural network structures, JAX allows developers to define any function and automatically compute its gradients using grad(), giving researchers flexibility to experiment with ==custom algorithms==. These functions can then be compiled using jit(), which relies on Google's XLA (Accelerated Linear Algebra) compiler to turn the code into highly optimized machine instructions — this is what gives JAX its speed advantage. Because JAX was also designed with native support for TPUs and GPUs, this compiled code can run efficiently at scale across accelerators, making JAX especially well-suited for large-scale AI research where both computational speed and flexibility are
    critical.
    
    
4. What is the role of **Hugging Face Transformers** in developing NLP, LLM, computer vision, and multimodal AI applications?
    
    ​
    
    Hugging Face Transformers plays a central role by providing a ==unified, easy-to-use interface for accessing== thousands of pretrained models across NLP, LLMs, computer vision, and multimodal AI — similar to how GitHub hosts and shares code, the Hugging Face Hub hosts and shares pretrained models. Developers can choose a model (e.g. GPT, Llama), load its corresponding tokenizer or processor to convert raw input (text, images) into a format the model understands, then fine-tune the model on their own data or use it directly for inference. This significantly lowers the barrier to building AI applications, since ==developers don't need to train models from scratch== — they can quickly adapt existing pretrained models and deploy them for real-world use.
    
    ​
    
5. What problem does **ONNX** solve when AI models need to work across different frameworks and platforms?
    
    ​
    
    Different AI frameworks such as PyTorch, TensorFlow, and JAX produce models in their own proprietary formats, which are ==often incompatible with each other==. This creates a major problem when a model trained in one framework needs to be deployed on a platform or runtime that only supports another format. ONNX (Open Neural Network Exchange) solves this by defining a framework-agnostic, standardized model format. A model trained in any framework ==can be exported to ONNX==, then executed and optimized using ONNX Runtime, allowing it to run consistently across different platforms — including cloud servers, edge devices, and mobile devices — without needing to be rebuilt or retrained for each target environment.
    
    ​
    
6. Why is **vLLM** particularly useful for serving and scaling Large Language Models (LLMs)?

	vLLM is particularly useful for serving and scaling LLMs because it ==solves the memory inefficiency problem== that occurs when multiple users send requests to an LLM at the same time. Normally, serving many concurrent users requires storing large amounts of intermediate attention data (KV cache) for each conversation, which can quickly exhaust GPU memory and increase latency. vLLM solves this through ==PagedAttention==, which ==manages memory== similarly to how operating systems handle paged memory — breaking data into smaller blocks that can be allocated and ==reused more efficiently==. This allows vLLM to serve significantly more concurrent users with ==lower latency.== Additionally, vLLM provides an OpenAI-compatible API, making it easy to integrate into existing applications, and supports multi-worker scaling, allowing it to distribute the workload across multiple machines as demand grows.
​
### Part B – Comparison

​

|**Criteria**|**PyTorch**|**TensorFlow**|**JAX**|**Hugging Face**|**ONNX**|**vLLM**|
|---|---|---|---|---|---|---|
|Main Purpose|Model Training|Training + Deployment|High-performance /Computing|Pretrained Models|Model Interoperability /Deployment|High-Throughput LLM Serving|
|Developer/Organization|Meta AI|Google|Google|Hugging Face|Open-Source Community|UC Berkeley|
|Best Use Case|Research / Model Development|Production ML/ Model Deployment|Model Training|Using / Fine-tuning Pretrained Models|Cross-platform / Model Deployment|LLM Interface at Scale|
|Training|High|High|High|Medium|Low|Low|
|Deployment|Low|High|Low|Medium|High|High|
|LLM Support|Medium|High|High|High|Medium|High|
|Performance|Medium|Medium|High|High|High|High|
|Scalability|Medium|High|High|High|High|High|
|Ease of Use|Medium|Difficult|Difficult|Easy|Medium|Easy|
|Major Advantage|Debugging / Model Iteration|Standard SOP / Complete Ecosystem|High-performance / Automatic Differentiation|Model Library / Pretraining|Compatibility|Efficient Concurrent LLM Serving (PagedAttention)|
|Limitation|Not easy to deployment|Hard to learn|Hard to learn|Performance heavily depends on underlying framework (PyTorch/TF); high resource requirements|Not all operations/layers from every framework convert perfectly; does not support training|Inference only, no training support; requires significant GPU resources|

​

### Part C – Scenario-Based Questions

7. **Scenario 1:** A researcher wants to experiment with a new deep learning model and needs flexible model development and debugging. Which framework would you recommend? **Why?**
    
	For this scenario, I would recommend using PyTorch for model development and debugging. This is because PyTorch's major advantage lies in its dynamic computation graph (Eager Execution), which builds the computation graph on the fly as the code runs. This allows researchers to inspect intermediate results, modify the model architecture, and debug in real time during experimentation — rather than having to define the entire model structure upfront before running it. This flexibility makes PyTorch especially well- suited for research scenarios that require frequent trial-and-error and iterative model design.

​

8. **Scenario 2:** A company wants to train an AI model and deploy it into a production environment. Which framework/tool would be appropriate? **Explain your choice.**
   
	In this scenario, I would recommend TensorFlow to train the AI model and deploy it into a production environment. This is because TensorFlow was designed with production deployment in mind, offering a complete and mature ecosystem — including TF Serving for server-side deployment, LiteRT for mobile and edge devices, and TF.js for browser-based deployment. This makes it easy for the company to not only train the model but also deploy, monitor, and maintain it consistently across different production environments. If the AI model specifically involves serving a large language model to end users, vLLM could be used alongside TensorFlow-trained models (via ONNX conversion) to optimize LLM-specific inference performance.

​

9. **Scenario 3:** A developer wants to use a pretrained Llama or similar language model instead of building an LLM from scratch. Which tool would be most useful? **Why?**
    
    ​
    
    For using a pretrained Llama model, I would recommend Hugging Face Transformers instead of building an LLM from scratch. With Hugging Face, you can download and integrate existing pretrained models (such as Llama, Mistral, or GPT) directly into your project, which significantly improves development efficiency and eliminates the need to train a model from the ground up.
    
    ​
    
10. **Scenario 4:** An organization has a model trained using one framework but needs to deploy it on different platforms and runtimes. Which technology should they consider? **Explain.**
    
    ​
    
    For deploying models on different platforms and runtimes, I would recommend choosing ONNX. With ONNX, you can export your trained model into the ONNX format, then execute and optimize it using ONNX Runtime, allowing it to run consistently across different platforms including cloud servers, edge devices, and mobile devices without needing to be rebuilt or retrained for each target environment.
    
    ​
    
11. **Scenario 5:** A company needs to serve multiple users requesting responses from an LLM simultaneously. Which tool would be appropriate, and what feature makes it suitable?
    
	In this scenario , I would like recommend use vLLM , because vLLM solves this through PagedAttention, which manages memory similarly to how operating systems handle paged memory breaking data into smaller blocks that can be allocated and reused more efficiently. This allows vLLM to serve significantly more concurrent users with lower latency. Additionally, vLLM provides an OpenAI- compatible API, making it easy for the company to integrate the LLM into their existing applications, and supports multi-worker scaling to handle growing numbers of concurrent requests as the user base expands.

​

### Part D – Analysis Question

**12. If you were developing an AI-powered student assistance system, which framework or tool would you choose among PyTorch, TensorFlow, JAX, Hugging Face Transformers, ONNX, and vLLM? Explain your choice based on:**

- Development
    
- Model training
    
- Pretrained models
    
- Deployment
    
- Performance
    
- Scalability
    

For an AI-powered student assistance system, I would primarily choose Hugging Face Transformers combined with PyTorch for development and fine-tuning, and vLLM for deployment and serving.

**Development:** I would use PyTorch for its dynamic graph and ease of debugging, since fine-tuning and adjusting a conversational model requires frequent experimentation.

**Model Training:** Rather than training a language model from scratch, I would fine-tune an existing pretrained model, since training an LLM from zero is resource-prohibitive for a student project.

**Pretrained Models:** Hugging Face Transformers provides access to thousands of pretrained LLMs (e.g. Llama, Mistral), which can be fine-tuned on educational Q&A data instead of building a model from scratch.

**Deployment:** Once fine-tuned, the model can be deployed using vLLM, which is optimized for serving LLMs efficiently. If cross-platform deployment (e.g. mobile app) were required, I would additionally convert the model using ONNX.

**Performance:** vLLM's PagedAttention mechanism ensures efficient memory usage, keeping response times low even as more students use the system simultaneously.

**Scalability:** vLLM supports multi-worker scaling, allowing the system to handle a growing number of concurrent student users, such as during exam periods when demand for the assistant peaks.

JAX and TensorFlow were not chosen for this scenario, since the priority here is leveraging existing pretrained LLMs and serving them efficiently a strength of the PyTorch/Hugging Face/vLLM ecosystem rather than training large models from scratch or requiring TensorFlow's broader production ecosystem (e.g. mobile/browser deployment), which isn't the primary need for this use case.

## Final Lab Question

**13. Which AI framework/tool is the "best" among the six? Explain why there is no single best framework for every AI project.**

There is no single AI framework or tool that is the "best" among the six, because ==each one was designed with a different goal in mind, and each involves trade-offs.== For example, PyTorch prioritizes flexibility and ease of debugging over raw execution speed, while TensorFlow prioritizes deployment stability and ecosystem completeness over research flexibility. JAX prioritizes computational performance through functional programming and JIT compilation, but has a steeper learning curve. Hugging Face simplifies access to pretrained models but depends on underlying frameworks for performance. ONNX solves cross-platform compatibility but doesn't support training. vLLM excels at serving LLMs at scale but is not designed for training at all.

Because these tools solve different problems, real-world AI projects often combine several of them rather than relying on just one. For instance, a developer might use PyTorch or JAX to research and train a model, use Hugging Face to access and fine-tune pretrained models, convert the final model to ONNX for cross-platform deployment, and use vLLM specifically to serve a large language model to many concurrent users. This shows that the "best" tool always depends on the specific requirements of the project such as whether the priority is research flexibility, training performance, deployment stability, or serving scalability rather than any single framework being universally superior.







----
## References
