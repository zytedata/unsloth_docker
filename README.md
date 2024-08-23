# unsloth_docker

A minimal working `Dockerfile` that has unsloth with all the other dependencies.

### How to use

Build image:

```bash
docker build -t unsloth .
```

Run using GPUs:

```bash
docker run --gpus all -it unsloth
```


Import and to see if it's working. Run:

```python
from unsloth import FastLanguageModel

model, tokenizer = FastLanguageModel.from_pretrained(
    model_name="unsloth/Meta-Llama-3.1-8B-Instruct-bnb-4bit",
    max_seq_length=2048,
    dtype=None,
    load_in_4bit=True,
)
```

It shows that everything is fine (import ok and FA2 = True):


```
🦥 Unsloth: Will patch your computer to enable 2x faster free finetuning.
==((====))==  Unsloth 2024.8: Fast Llama patching. Transformers = 4.43.4.
   \\   /|    GPU: NVIDIA L4. Max memory: 21.964 GB. Platform = Linux.
O^O/ \_/ \    Pytorch: 2.2.1+cu121. CUDA = 8.9. CUDA Toolkit = 12.1.
\        /    Bfloat16 = TRUE. FA [Xformers = 0.0.25.post1. FA2 = True]
 "-____-"     Free Apache license: http://github.com/unslothai/unsloth
model.safetensors: 100%|███████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████| 5.70G/5.70G [00:32<00:00, 176MB/s]
generation_config.json: 100%|█████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████| 234/234 [00:00<00:00, 1.54MB/s]
tokenizer_config.json: 100%|██████████████████████████████████████████████████████████████████████████████████████████████████████████████████████| 55.4k/55.4k [00:00<00:00, 5.45MB/s]
tokenizer.json: 100%|█████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████| 9.09M/9.09M [00:00<00:00, 26.7MB/s]
special_tokens_map.json: 100%|████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████| 340/340 [00:00<00:00, 2.44MB/s]
```
