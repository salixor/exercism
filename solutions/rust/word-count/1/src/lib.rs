use std::collections::HashMap;

/// Count occurrences of words.
pub fn word_count(words: &str) -> HashMap<String, u32> {
    let mut map: HashMap<String, u32> = HashMap::new();
    words
        .split([
            ':', '!', '?', ',', '.', '@', '&', '&', '$', '#', '%', '^', '\t', '\n', ' ',
        ])
        .for_each(|word| {
            println!("{word} ");
            let word_lc = word.to_lowercase().trim_matches('\'').to_string();
            if word_lc != "" {
                map.insert(word_lc.clone(), *map.get(&word_lc).unwrap_or(&0) + 1);
            }
        });
    map
}
