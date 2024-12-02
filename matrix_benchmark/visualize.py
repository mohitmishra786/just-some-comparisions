import json
import matplotlib.pyplot as plt
import matplotlib.animation as animation
import numpy as np
from pathlib import Path

def load_results():
    results = {}
    results_dir = Path("results")
    for result_file in results_dir.glob("*_result.json"):
        with open(result_file) as f:
            data = json.load(f)
            language = result_file.stem.split("_")[0]
            results[language] = data["results"][0]["mean"]
    return results

def create_animation():
    results = load_results()
    if not results:
        print("No benchmark results found!")
        return

    languages = list(results.keys())
    times = list(results.values())

    # Normalize times
    max_time = max(times)
    normalized_times = [t/max_time for t in times]

    # Setup the figure
    fig, ax = plt.subplots(figsize=(12, 8))

    # Colors for each language
    colors = plt.cm.rainbow(np.linspace(0, 1, len(languages)))

    def animate(frame):
        ax.clear()
        ax.set_xlim(-2, 2)
        ax.set_ylim(-2, 2)

        # Draw circles and labels
        circles = []
        texts = []
        for i, (lang, time, color) in enumerate(zip(languages, times, colors)):
            angle = (frame / 50) * 2 * np.pi * (max_time / time)
            x = np.cos(angle)
            y = np.sin(angle)
            circle = plt.Circle((x, y), 0.1, color=color)
            ax.add_patch(circle)
            text = ax.text(x + 0.15, y, f'{lang}\n{time:.3f}s', fontsize=8)
            circles.append(circle)
            texts.append(text)

        ax.set_title('Matrix Multiplication Benchmark\n1000000x1000000 matrices')
        return circles + texts

    ani = animation.FuncAnimation(
        fig, animate, frames=200, interval=50, repeat=True,
        blit=True
    )

    # Save animation with higher quality
    ani.save('benchmark_animation.gif', writer='pillow', fps=30)
    plt.show()

if __name__ == "__main__":
    create_animation()